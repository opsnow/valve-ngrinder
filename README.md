# Terraform for nGrinder in AWS

## How to run

* you must have YOUR_PATH/YOUR_PEM_FILE.pem file
* you have to know your own ip

### use environment variables

* export TF_VAR_key_name="YOUR_PEM_FILE"
* export TF_VAR_key_path="YOUR_PATH"
* export TF_VAR_my_ip_address='["your_own_ip/32"]'

### use terraform variables file

* make var file (var.tfvars)

```tfvars
key_name = "YOUR_PEM_FILE"
key_path = "~/YOUR_PATH"
my_ip_address = [
    "your_own_ip/32"
    ]
```

* run
  * terraform apply -var-file=var.tfvars
  * terraform destroy -var-file=var.tfvars
