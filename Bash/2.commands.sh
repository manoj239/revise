uname -a            #type of os 
curl ipconfig.io
uptime
last reboot
To modify nginx page design change in this file  -  /var/www/html/index.nginx-debian.html 
cat /etc/lsb-release   #To get os type and release date too
x=Devsecops
    a)echo $x      O/p:Devsecops 
    b)size=${#x}   O/p:9
    c)echo ${x[@]:0:1}  O/p: D
    d)echo ${x[@]:2:2}  O/p: VS
    e)LENGTH=$(( ${#x} - 1))    O/p: 8

cat /etc/passwd | grep -i HOME   or grep -i -w ubuntu /etc/passwd  #-i is used to search without case sensitive
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
cat /etc/passwd | grep -E -w 'ubuntu|ubuntu1'   #-E is either ubuntu or ubuntu1 exact word bu using | OR
cat /tmp/event.log | grep -E -i 'error|denied
cat /etc/passwd | grep -i ubuntu | cut -d ":" -f1
ubuntu
cat /etc/passwd | grep -i ubuntu | cut -d ":" -f1,2,3
ubuntu:x:1000
cat /etc/passwd | grep -i -w ubun  #-w is used to search exact name, even if one letter is not there in the word, we will not get o/p
No output
cat /etc/ssh/sshd_config | grep -n -i passwordauthen #We will get the line numbers beacuse of 'n'
    66:#PasswordAuthentication yes
    88:# PasswordAuthentication.  Depending on your PAM configuration,
    92:# PAM authentication, then enable this but set PasswordAuthentication
echo "manojKumar" | fold -w1    # To get single letter from a word , we use fold with "w"
m
a
n
o
j
K
u
m
a
r

echo "manojKumar" | fold -w2 | shuf
jK
um
ma
no
ar
echo "manojKumar" | fold -w2 | shuf | head -1
ar
echo "manojKumar" | fold -w2 | shuf | tail -1
no
find / -name '*.zip'   #To find the files in root directory that is ending with zip
find / -name '*.zip' | xargs du 
find / -name '*.zip' | xargs du -h
find / -name '*.zip' -size +10M -size -100M # files which are sizes b/w 10 MB and 100MB
find / -name '*.zip' -size +10M -size -100M | xargs du -ch #Shows the disk usage of each file (du) and total all files space
find / -name '*.zip' -size +10M -size -30M | xargs rm -rf #Delete the files which are sizes b/w 10 MB and 30MB
find $1 -name "*.zip" -size +${20}M -size -${30}M | xargs du -ch
find /etc -mtime +1        #If today is March 25th, 2025, this command will find files in /etc 
#that were modified before March 24th, 2025.
find /etc -mtime -1        #If today is March 25th, 2025, this command will find files in /etc 
that were modified on or after March 24th, 2025
find / -path $(pwd) -prune -o -name ".zip" -size +10M -size -100M | xargs rm -rf
find / -name ".zip" -size +10M -size -60M -exec rm -rf {} +
find / -name "*.zip" -size +10M -size -60M -exec rm -rf {} +    #Danger command 
cat data | awk -F" " '{print $2}' | tr "-" "."
echo "Welcome to Devsecops" | tr -d 'e'                  -> Wlcom to Dvscops
echo "Welcome to Devsecops" | tr '[:lower:]' '[:upper:]' -> WELCOME TO DEVSECOPS
echo "Welcome to Devsecops" | tr '[:upper:]' '[:lower:]' -> welcome to devsecops
TR cannot do the following. So sed comes into picture
    1. It works character by character
    2. If I want to change a string  in a file at particular loaction , its not possible.
    3. If want to change a word/string/charc in the whole file it might be not possible

sed -i "66 s/.*PasswordAuthentication.*/PasswordAuthentication yes/" /etc/ssh/sshd_config  
grep -n -i PasswordAuthentication
                sed = stream editor                
                -i = edit file in-place
                66 = operate on line 66 only
                s/old/new/ = substitute old with new
                s/ — begin substitution.
                .*PasswordAuthentication.* — matches any line containing PasswordAuthentication (with any characters before or after it).
                PasswordAuthentication yes — this is what the matched line will be replaced with.

From below cut command is used, when we need to extract a word from a sentence, we use this 
    echo 'ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash' | cut -d ":" -f1 
    ubuntu
    echo 'ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash' | cut -d ":" -f4
    1000
    cat /etc/passwd | grep -i -w ubuntu | cut -d ":" -f1 
    ubuntu
    cat /etc/passwd | grep -i -w ubunt | cut -d ":" -f1 
    No answer for above command. 




aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r |wc -l
  a)vpc_count=$(aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r |wc -l)
  b)echo $vpc_count
  c)echo ${vpc_count}
  d)echo "${vpc_count}"

$1 can be called as argument or Parameter  which is passed to the script
REGION=$1
echo "Lets Get VPC Information for region $REGION..."
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
echo $VPC_COUNT
echo ${VPC_COUNT}
echo "${VPC_COUNT}"sa
echo "$REGION has a total VPC count of ${VPC_COUNT} VPC's"
echo "$0"
echo "$1"
#Execution syntax bash 3.InputRegion.sh <region-name>
 apt-get update >> /dev/null

--no-pager is a valid option for systemctl (and some other Linux tools like git, journalctl), but it is not supported by AWS CLI
   a)systemctl status nginx --no-pager
   b)systemctl status nginx --no-pager >/dev/null #Redirects only stdout (standard output) to /dev/null
   c)systemctl status nginx --no-pager >/dev/null 2>&1 #To suppress both stdout and stderr
   | Command                             | Hides Stdout? | Hides Stderr? | Visible Output      |
   | ----------------------------------- | ------------- | ------------- | ------------------- |     |
   | `... >/dev/null`                    | ✅           | ❌            | Error still printed |
   | `... >/dev/null 2>&1`               | ✅           | ✅            | Nothing printed     |
   d)crontab -l > tmp/jobs.txt 2>/dev/null #Suppresses error messages by redirecting standard error (2) to /dev/null.
   e)Suppress both stdout and stderr (nothing will be shown): crontab -l > /dev/null 2>&1
   f)Suppress only stdout, but allow errors to display: crontab -l > /dev/null
   g)Suppress only errors, but keep stdout: crontab -l 2>/dev/null
   h)echo "nanna" | tee /tmp/silk    #Redirects and print the output in screen, but o/p will overrirde
   i)echo "nanna" |tee -a /tmp/silk  #Redirects and print the output in screen, o/p will be appended
   j)| Usage           | Behavior                               |
     | --------------- | -------------------------------------- |
     | `for x in $@`   | Splits on whitespace (not safe)        |
     | `for x in $*`   | Also splits on whitespace (same issue) |
     | `for x in "$@"` | Correct — keeps each argument separate |  bash lit.sh us-east-1  "us-east-1 ap-south-1"
     | `for x in "$*"` | Treats all arguments as one string     |
   k)bash ty.sh > /dev/null 2>1  #redirects stdout to /dev/null (discard output), 2>1 — redirects stderr to a file named 1 in the current directory (not to stdout).


to check even or odd 
        #!/bin/bash
        rm -rf /tmp/EVEN.log && rm -rf /tmp/ODD.log
        for I in {2..30}; do
            if [ $(expr $I % 2) == 0 ]; then
                echo "I is $I and its a EVEN number" >>/tmp/EVEN.log
            else
                echo  "I is $I and its a ODD number" >>/tmp/ODD.log
            fi
        done
                              OR
        #!/bin/bash
        rm -rf /tmp/EVEN.log && rm -rf /tmp/ODD.log
        for I in {2..30}; do
            if [ $(($I % 2)) == 0 ]; then
                echo "I is $I and its a EVEN number" | tee -a /tmp/TEE-EVEN.log
            else
                echo  "I is $I and its a ODD number" | tee -a /tmp/TEE-ODD.log
            fi
        done

To add a user and update the password, when he login. We need to give yes in this below file and next restart ssh
 nano /etc/ssh/sshd_config.d/60-cloudimg-settings.conf or cat /etc/ssh/sshd_config
#service ssh restart
            #!/bin/bash
            USERNAME=johndoe
            sudo useradd -m "$USERNAME" --shell /bin/bash
            SPEC=$(echo '@#%&*_-' | fold -w1 | shuf | head -1)
            PASSWORD="India@${RANDOM}${SPEC}"
            echo "$USERNAME:$PASSWORD" | sudo chpasswd
            sudo passwd -e "$USERNAME"
            echo "Login with username: $USERNAME"
            echo "Temporary password: $PASSWORD"

for FILE in $(find / -name awscliv2.zip)
mkdir /tmp/demo
do
echo $FILE
cp $FILE /tmp/demo
done

#!/bin/bash
read -p "Enter the minimum Size : " MIN_SIZE
read -p "Enter the maximum Size : " MAX_SIZE
read -p "Enter the path : "  FILE_PATH
find $FILE_PATH -name "*.zip" -size +${MIN_SIZE}M -size -$(MAX_SIZE)M | xargs du -ch