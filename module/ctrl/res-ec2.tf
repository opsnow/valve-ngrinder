
resource "aws_instance" "controller_public" {
  # ami                    = "${data.aws_ami.ubuntu.id}"
  ami                    = "ami-0fd02cb7da42ee5e0"
  instance_type          = "t2.small"
  vpc_security_group_ids = ["${aws_security_group.this.id}"]
  key_name               = var.key_name

  # This EC2 Instance has a public IP and will be accessible directly from the public Internet
  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_name}-public"
  }
}



# locals {
#   userdata = <<EOF
# #!/bin/bash -xe
# sudo apt update
# sudo apt install openjdk-8-jre-headless
# sudo apt install tomcat8
# sudo apt-get install tomcat8-docs tomcat8-examples tomcat8-admin
# sudo systemctl restart tomcat8

# EOF

# }

# resource "aws_launch_template" "this" {
# #  count = var.launch_template_enable ? length(var.mixed_instances) == 0 ? 1 : 0 : 0

#   name_prefix   = "ng-SPOT-"
#   image_id      = var.ami_id
#   instance_type = "t2.small"
# #  user_data     = base64encode(local.userdata)

#   key_name = var.key_name

#   block_device_mappings {
#     device_name = "/dev/xvda"

#     ebs {
#       volume_type           = var.volume_type
#       volume_size           = var.volume_size
#       delete_on_termination = true
#     }
#   }

#   # iam_instance_profile {
#   #   name = aws_iam_instance_profile.worker.name
#   # }

#   network_interfaces {
#     delete_on_termination       = true
#     associate_public_ip_address = var.associate_public_ip_address
#     security_groups             = [aws_security_group.this.id]
#   }

#   instance_market_options {
#     market_type = "spot"
#   }


# }

# resource "aws_autoscaling_group" "this" {
#   # count = var.launch_template_enable ? length(var.mixed_instances) == 0 ? 1 : 0 : 0

#   name = "ng-SPOT"

#   min_size = 1
#   max_size = 1

#   vpc_zone_identifier = ["${data.aws_subnet.a.id}"]

#   launch_template {
#     id      = aws_launch_template.this.id
#     version = "$Latest"
#   }

#   tags = concat(
#     [
#       {
#         "key"                 = "asg:lifecycle"
#         "value"               = "spot"
#         "propagate_at_launch" = true
#       },
#     ],
#     [
#       {
#         key = "Name"
#         value = "ngrinder-controller"
#         propagate_at_launch = true
#       }
#     ],
#   )
# }


# resource "aws_network_interface" "my" {
#   subnet_id   = "${data.aws_subnet.a.id}"

#   tags = {
#     Name = "my"
#   }
# }



# # spot 으로 만드니 tag 가 안먹히고 sg 가 연결되지 않음.
# # resource "aws_spot_instance_request" "web" {
# resource "aws_instance" "web" {
#   ami           = var.ami_id

#   # controller require 1 core cpu, 2GiB memory
#   instance_type = "t2.small"

#   # # spot instance
#   # spot_price = "0.0086"

#   network_interface {
#     network_interface_id = "${aws_network_interface.my.id}"
#     device_index         = 0
#   }


#   associate_public_ip_address = var.associate_public_ip_address
#   # security_groups             = [aws_security_group.this.id]

#   vpc_security_group_ids = [
#     "${aws_security_group.this.id}",
#   ]

#   key_name = "SEOUL-SRE-K8S-BASTION"

#   tags = {
#     Name = "nGrinder Controller"
#     Type = "controller"
#   }
# }
