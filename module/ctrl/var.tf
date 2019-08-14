

variable "key_name" {
  description = "pem key name"
  type        = string
  default     = "SEOUL-SRE-K8S-BASTION"
}

variable "key_path" {
  description = "pem key path"
  type        = string
  default     = "~/.ssh/pem"
}

variable "instance_name" {
    default = "ngrinder"
}

variable "my_ip_address" {
  description = "List of IP Address to permit access"
  type        = list(string)
  default     = ["*"]
}

