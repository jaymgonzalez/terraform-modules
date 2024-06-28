locals {
  instance_name = "db-server"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_type

  tags = {
    Name = local.instance_name
  }
}


module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"
}

