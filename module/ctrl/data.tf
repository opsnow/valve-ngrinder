

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

data "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "default"
  }
}

data "aws_subnet" "a" {
  vpc_id            = "${data.aws_vpc.default.id}"
  cidr_block        = "172.31.0.0/20"
  availability_zone = "ap-northeast-2a"

}
