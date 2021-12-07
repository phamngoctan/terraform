# Procedure to run Terraform:

Init the Terraform:
```
terraform init
  tanpn-fargate-demo (name of S3 bucket)
  terraform (path)
  ap-southeast-1 (region)
```

Run the plan:
```
terraform plan --var-file="production.tfvars"
```

Apply the changes:
```
terraform apply --var-file="production.tfvars"
```

Delete the whole infrastructure:
```
terraform destroy --var-file="production.tfvars"
```
