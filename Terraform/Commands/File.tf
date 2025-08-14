terraform individually can't do anything, it uses plugins to build infrstructure. When we give terraform init 
all the plugins like .terraform etc files will get installed.

terraform init, terraform fmt,validate, plan, apply
In interview they will ask us, how to edit a state file, we should say, we shouldn't edit the state file directly,
instead  by using terraform state commands , we can do it. To get the state commands , give <terraform state>
    terraform state list :We will get the resources list ,what are the resources created by terraform.
    terraform state rm <resourcename> : When you need to remove specific resource in state file. Removing from state file
    doesnt mean destroying , just removing from state file. When you give terraform apply & destroy , there will be
    no resources to change
    terraform state show <resorce name>
When you want to rename any resource name, that is created by terraform, we should give below comamnds. Before 
that, we need to edit the names in vs code
    a)terraform state list
      aws_security_group.allow_all                                                                                                                                                                 aws_subnet.subnet1-public                                                                           aws_subnet.subnet2-public 
      aws_subnet.subnet3-public
      random_password.password_5
      aws_vpc.default
    b)terraform state mv random_password.password_5 random_password.password_54 
    c)terraform apply #if we see, there will be no changes 

When you want to delete particular resource, terraform destroy will not work as it will delete all resources, but
if you need to delete particular resource give
    #terraform destroy -target random_password.password_5
            OR
    #for each ($i in 1..5)
    {
        terraform destroy -target random_password.password_$i --auto-approve
    }
When you want to rotate the password give like below. Taint is used to rotate the password
    #terraform taint random_password.password_$i
            OR
    #for each ($i in 1..5)
    {
        terraform taint random_password.password_$i
    }