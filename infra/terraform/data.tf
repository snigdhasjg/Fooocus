data "aws_vpc" "this" {
  state = "available"

  tags = {
    environment = "sandbox",
    Name        = "joe-vpc"
  }
}

data "aws_subnets" "public-subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  filter {
    name = "tag:connectivity"

    values = [
      "public"
    ]
  }
}

data "aws_ami" "amz_linux" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^Deep Learning Proprietary Nvidia Driver AMI GPU PyTorch 1\\.13\\.1 \\(Amazon Linux 2\\) \\d{8}$"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "ena-support"
    values = [true]
  }
}
