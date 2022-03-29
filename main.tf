#aws provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

#Create key-pair for logging into EC2 
resource "aws_key_pair" "webserver-key" {
  key_name   = "webserver-key"
  public_key = file("./key_name.pub")
}

#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "webserver-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}