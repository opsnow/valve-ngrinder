resource "aws_security_group" "this" {
  name = "${var.instance_name}"

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = var.my_ip_address
  }

  tags = {
    Name = "${var.instance_name}"
  }
}


# resource "aws_security_group" "this" {

#   vpc_id = "${data.aws_vpc.default.id}"

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

#   // ALL
#   egress {
#     from_port   = "0"
#     to_port     = "0"
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   // SSH
#   ingress {
#     from_port   = "22"
#     to_port     = "22"
#     protocol    = "tcp"
#     cidr_blocks = ["58.151.93.9/32"]
#   }

#   tags = {
#     Name = "ngsg"
#   }
# }

# worker security group

# resource "aws_security_group" "this" {
#   name        = "ngrinder"
#   description = "Security group for all ngrinder nodes"

#   vpc_id = data.aws_vpc.default.id

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     "Name" = "ngrinder"
#   }
# }

# resource "aws_security_group_rule" "ingress-self" {
#   description              = "Allow nodes to communicate with each other"
#   security_group_id        = aws_security_group.this.id
#   source_security_group_id = aws_security_group.this.id
#   from_port                = 0
#   to_port                  = 65535
#   protocol                 = "-1"
#   type                     = "ingress"
# }

# resource "aws_security_group_rule" "ingress-admin" {
#   description       = "Allow workstation to communicate with all"
#   security_group_id = aws_security_group.this.id
#   cidr_blocks       = var.my_ip_address
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "-1"
#   type              = "ingress"
# }
