# resource "aws_security_group" "this" {
#   name = "${var.instance_name}"

#   egress {
#     from_port = "0"
#     to_port   = "0"
#     protocol  = "-1"
#     self      = true
#   }

#   ingress {
#     from_port = "0"
#     to_port   = "0"
#     protocol  = "-1"
#     self      = true
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"

#     # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
#     # allow SSH requests from trusted servers, such as a bastion host or VPN server.
#     cidr_blocks = var.my_ip_address
#   }

#   tags = {
#     Name = "${var.instance_name}"
#   }
# }
