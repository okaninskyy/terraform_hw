#creates VPC, one public subnet, two private subnets, one EC2 instance and one MYSQL RDS instance
#declare variables

variable "access_key" {
  default = "AKIAYB224MW2HPWNS5NB"
}

variable "secret_key" {
  default = "gSuDXDzmk4E0O3vXUo0RT1Fa68JBI5RKmLS1pacL"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_one_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_two_cidr" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "route_table_cidr" {
  default = "0.0.0.0/0"
}

variable "web_ports" {
  default = ["22", "80", "443", "3306"]
}

variable "db_ports" {
  default = ["22", "3306"]
}


