resource "aws_instance" "agent" {
  count                  = var.agent_count
  # ami                    = "${data.aws_ami.ubuntu.id}"
  ami                    = "ami-0fd02cb7da42ee5e0"
  instance_type          = "t2.medium"
  vpc_security_group_ids = [var.common_sg]
  key_name               = var.key_name

  # This EC2 Instance has a public IP and will be accessible directly from the public Internet
  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_name}-public-${count.index}"
  }
}
