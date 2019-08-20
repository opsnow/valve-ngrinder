# nGrinder controller server deploy and install and RUN

provider "aws" {
  region = "ap-northeast-2"
}

############################################################
# you must have YOUR_PATH/YOUR_PEM_FILE.pem file
# you have to know your own ip
# export TF_VAR_key_name="YOUR_PEM_FILE"
# export TF_VAR_key_path="YOUR_PATH"
# export TF_VAR_my_ip_address='["your_own_ip/32"]'
#### OR
# make var file (var.tfvars)
# 
# key_name = "YOUR_PEM_FILE"
# key_path = "~/YOUR_PATH"
# my_ip_address = [
#     "your_own_ip/32"
#     ]
#
# run
# terraform apply -var-file=var.tfvars
# terraform destroy -var-file=var.tfvars
############################################################

variable "key_name" {
  description = "pem key name"
  type        = string
}

variable "key_path" {
  description = "pem key path"
  type        = string
}

variable "my_ip_address" {
  description = "List of IP Address to permit access"
  type        = list(string)
#  default     = ["*"]
}

variable "agent_count" {
  description = "how many"
  default     = 1
}


# locals {
#   kname = var.key_name
#   kpath = var.key_path
#   ipaddr = var.my_ip_address
# }


module "ngrinder_ctrl" {
  source = "./module/ctrl"

  # Must have pem file in {key_path}/{key_name}.pem
  key_name = var.key_name
  key_path = var.key_path

  my_ip_address = var.my_ip_address
}

# delivery common security group id to agents
locals {
  common_sg = module.ngrinder_ctrl.common_sg
  controller_private_ip = module.ngrinder_ctrl.controller_private_ip
}

module "ngrinder_agent" {
  source = "./module/agent"

  # how many agents to run
  agent_count = var.agent_count

  # Must have pem file in {key_path}/{key_name}.pem
  key_name = var.key_name
  key_path = var.key_path

  # from controller module
  controller_ip = local.controller_private_ip
  common_sg = local.common_sg
}

output "ssh_connect" {
  value = module.ngrinder_ctrl.ssh
}

output "web_connect" {
  value = module.ngrinder_ctrl.ngrinder_connect
}

output "agent_ssh_connect" {
  value = module.ngrinder_agent.public_ip
}
