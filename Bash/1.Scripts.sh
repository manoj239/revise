for i in {1..10}
do
    cp terraform.zip terraform$I.zip
done
------------------------------------------------
demofunc1 () {
        echo "Welcome to function1"
}
demofunc2 () {
        echo "Welcome to function2"
}

demofunc1
demofunc2
---------------------------------------------------
function demofunc1 {
        echo "Welcome to function1"
}
function demofunc2 {
        echo "Welcome to function2"
}
demofunc1
demofunc2
--------------------------------------------------------
Get_VPC() {
    echo "Running the function To list VPCs in $1"
    vpc_list=$(aws ec2 describe-vpcs --region $1 | jq .Vpcs[].VpcId -r)
    for vpc in $(echo $vpc_list); do
        echo "The VPC ID is:$vpc"
        echo "======================"
    done
}

for REG in $@; do
    Get_VPC $REG
done
------------------------------------------------------------

delete_ebs_vols() {
    vols=$(aws ec2 describe-volumes --region $1 | jq ".Volumes[].VolumeId" -r)
    for vol in $vols; do
        size=$(aws ec2 describe-volumes --volume-ids $vol --region $1 | jq ".Volumes[].Size" -r)
        state=$(aws ec2 describe-volumes --volume-ids $vol --region $1 | jq ".Volumes[].State" -r)
        if [ ${size} -gt 5 -a ${state} == 'in-use' ]; then
            echo "$vol is valid volume .Dont Delete"
        else
            echo "Deleting volume $vol in the Region $1"
            aws ec2 delete-volume --volume-id $vol --region $1
        fi
    done
}

#delete_ebs_vols $1 for single region
REGION_LIST=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r | wc -l)
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
echo "We have a total of $REGION_LIST Regions..."
for REGION in ${REGIONS[@]}; do
    echo "Lets Delete the volumes for Region ${REGION}.."
    delete_ebs_vols $REGION
done

------------------------------------------------

#1/bin/bash
function subnets {
    echo "******************************************************"
    echo "**Getting SUBNETS info VPC $VPC in region $REGION***"
    echo "******************************************************"
    aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".Subnets[].SubnetId"
    echo "******************************************************"
}

function sg {
    echo "******************************************************"
    echo "**Getting Security Group info VPC $VPC in region $REGION***"
    echo "******************************************************"
    aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".SecurityGroups[].GroupName"
    echo "******************************************************"
}

vpcs() {
    for REGION in $@; do
        echo "Getting VPC List for Regions $REGION..."
        vpcs=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r)
        echo $vpcs
        echo "--------------------------"
        for VPC in $vpcs; do
            subnets $VPC
        done
        for VPC in $vpcs; do
            sg $VPC
        done
    done
}
vpcs $@
----------------------------------------------------------------------
INPUT_STRING=$1
SIZE=${#INPUT_STRING}
STRING_LENGTH=$(expr $SIZE - 1)
REVERSE=''

for (( I=$STRING_LENGTH; I>=0; I-- )); do
    REVERSE=${REVERSE}${INPUT_STRING:$I:1}
done

if [ "$INPUT_STRING" = "$REVERSE" ]; then
    echo "$INPUT_STRING is a palindrome"
else
    echo "$INPUT_STRING is not a palindrome"
fi
--------------------------------------------------------------------
for INPUT_STRING in $@; do
    SIZE=${#INPUT_STRING}
    STRING_LENGTH=$(expr $SIZE - 1)
    REVERSE=''

    for ((I = $STRING_LENGTH; I >= 0; I--)); do
        REVERSE=${REVERSE}${INPUT_STRING[@]:$I:1}
    done

    if [ "$INPUT_STRING" = "$REVERSE" ]; then
        echo "$INPUT_STRING is a palindrome"
    else
        echo "$INPUT_STRING is not a palindrome"
    fi
done
------------------------------------------------------------------------

PERCENT=30
if [[ $# -le 0 ]]; then
    printf "Use default value of ${PERCENT} for threshold.\n"
#test if argument is an integer
#if it is , use that as percent , if not use default
else
    if [ $1 -le 100 -a $1 -gt 0 ]; then
        PERCENT=$1
    else
        echo "INVALID INPUT Value . The Threshold value Must be Between 0 to 100"
        exit 1
    fi
fi

#let percent +=0"
#printf "Threshold = %d\n" $PERCENT
echo "Threshold = $PERCENT"
df -Ph | grep -i root | awk '{ print $5,$1 }' | while read data; do
    usedspace=$(echo $data | awk '{print $1}' | sed s/%//g)
    partition=$(echo $data | awk '{print $2}')
    if [ $usedspace -ge $PERCENT ]; then
        echo "WARNING: The partition \"$partition\" has used $usedspace% of total available space and above threshold of
     $PERCENT  -Date: $(date)"
    else
        echo "Your disk space of \"$partition\" is well below the threshold of $PERCENT and current utilization 
     is $usedspace% ."
    fi
done
----------------------------------------------------------------------
Log rotation

# File path for log rotation
#f=/var/log/nginx/access.log
read -p "Enter The File Path(Eg:/var/log/nginx/access.log): " f

if [ ! -f $f ]; then
    echo "$f does not exist!"
    exit
fi

#touch ${f}
MAXSIZE=$((10 * 1024))

# Get the actual file size
size=$(du -b ${f} | tr -s '\t' ' ' | cut -d ' ' -f1)

# Check if file size exceeds the limit
if [ ${size} -gt ${MAXSIZE} ]; then 
    echo Rotating!

    # Create timestamp
    timestamp=$(date +%s)
    # Rename the log file with timestamp
    mv ${f} ${f}.$timestamp
    aws s3 cp ${f}.$timestamp s3://genrelpu/${f}.$timestamp
    # Create a new empty log file
    touch $f
else
    echo "The file '$f' size is ${size} which is less than 10MB. No need to rotate."
fi
------------------------------------------------
