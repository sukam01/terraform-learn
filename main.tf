provider "aws" {
   region = "us-west-2"
   }
   
variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}
variable env_prefix {}

resource "aws_vpc" "myapp-vpc"{
   cidr_block = var.vpc_cidr_block
   tags = {
	Name: "${var.env_prefix}-vpc"
	}
}

resource "aws_subnet" "myapp-subnet-1"{
   vpc_id = aws_vpc.myapp-vpc.id
   cidr_block = var.subnet_cidr_block
   availability_zone = var.avail_zone
   tags = {
	Name: "${var.env_prefix}-subnet-1"
	}
}

resource "aws_route_table" "myapp-route-table" {
		vpc_id = aws_vpc.myapp-vpc.id
		route {
			cidr_block = "0.0.0.0/0"
			gateway_id = aws_internet_gateway.myapp-igw.id
		}
		tags = {
			Name: "${var.env_prefix}-rtb"
		}
}

resource "aws_internet_gateway" "myapp-igw" {
	vpc_id = aws_vpc.myapp-vpc.id
	tags = {
		Name: "${var.env_prefix}-igw"
	}
}

resource "aws_route_table_association" "a-rtb-subnet" {
	subnet_id = aws_subnet.myapp-subnet-1.id
	route_table_id = aws_route_table.myapp-route-table.id
}