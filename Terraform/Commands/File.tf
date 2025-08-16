terraform individually can't do anything, it uses plugins to build infrstructure. When we 
give terraform init ,all the plugins like .terraform etc files will get installed.

terraform init, terraform fmt,validate, plan, apply
In interview they will ask us, how to edit a state file, we should say, we shouldn't edit
the state file directly,instead  by using terraform state commands , we can do it. To get
the state commands , give <terraform state>. editing the Terraform state file directly is
risky and not recommended. The safe way is to use terraform state subcommands.
    a)terraform state list :We will get the resources list ,what are the resources created
      by terraform/managed by terraform
    b)terraform state rm <resourcename> : When you need to remove specific resource in 
    state file. Removes a resource from the state file without destroying it in 
    real infrastructure.. When you give terraform apply & destroy , there will be
    no resources to change
            #terraform state rm aws_s3_bucket.aws58repl #Terraform “forgets” about this bucket, but the bucket still exists in AWS.            
    c)terraform state show <resorce name>
When you want to rename any resource name, that is created by terraform, we should give
below comamnds. Before that, we need to edit the names in vs code
    a)terraform state list
      aws_security_group.allow_all                                                                                                                                                                 aws_subnet.subnet1-public                                                                           aws_subnet.subnet2-public 
      aws_subnet.subnet3-public
      random_password.password_5
      aws_vpc.default
    b)terraform state mv random_password.password_5 random_password.password_54 
    c)terraform apply #if we see, there will be no changes 

When you want to delete particular resource, terraform destroy will not work as it will
delete all resources, but if you need to delete particular resource give
    #terraform destroy -target random_password.password_5
            OR
    #for each ($i in 1..5)
    {
        terraform destroy -target random_password.password_$i --auto-approve
    }
When you want to rotate the password give like below. Taint is used to rotate the password.
Whenever if we tainted any resource, it will get destroy and  new resource will get create,
when we give terraform apply. terraform taint can be used on EC2 instances
 (or any Terraform-managed resource).
    #terraform taint random_password.password_$i
            OR
    #for each ($i in 1..5)
    {
        terraform taint random_password.password_$i
    }
*So basically , in above we if we give terraform apply, first resources will get deleted and 
later , new resource will get replaced, but sometimes in production, first resources should
re-placed, next destroy should happen. To do so, we use lifecycle hooks/arguments. 
Give like below. Create the new resource first.Then destroy the old one (only after the new 
resource is ready). This ensures zero downtime. Use this when downtime is unacceptable.
        lifecycle {
            create_before_destroy = true
        }
If tags on this resource are changed outside of Terraform, don’t try to overwrite them
       lifecycle {
            ignore_changes = [ tags ]
        }

What ignore_changes = [tags] does
Terraform normally keeps your AWS resources exactly like your .tf files say. If something 
changes outside of Terraform (like in the AWS console), Terraform will try to "fix" it 
back. After giving above command, terraform says:
"I won't complain if tags change outside Terraform, I’ll leave them alone."
Terraform won’t care if:
    Someone adds new tags in AWS
    Someone removes or changes tags in AWS
    It will keep its hands off.
When NOT to use it: If you want Terraform to be the single source of truth and enforce exact tags

    lifecycle {
            prevent_destroy = true
     }
If someone runs terraform destroy or changes the config in a way that would replace 
this resource, don’t do it. Throw an error instead." This will help us, when we dont want 
to delete unexpectly

When you manually create s3 bucket, and if you need to bring to terraformform manegemnt, 
give below comamnd. Terraform plan is used to  see if Terraform’s state matches AWS. 
    #terraform import <RESOURCE_TYPE>.<RESOURCE_NAME> <IDENTIFIER>
        #terraform import aws_s3_bucket.aws58repl awsb58repl
        #terraform plan
        #teeraform state show aws_s3_bucket.aws58repl awsb58repl
After you run terraform import:
Terraform updates the state file (terraform.tfstate) to map
   "aws_s3_bucket.aws58repl" → "awsb58repl" in AWS.

This mapping tells Terraform: “When I manage aws_s3_bucket.aws58repl, I’m talking about the 
real AWS bucket awsb58repl.”
RESOURCE_NAME is used to save the name in state file. If you changed the RESOURCE_NAME 
in your .tf file later, Terraform would think it’s a different resource unless you also 
rename it in the state file with terraform state mv.