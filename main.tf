provider "aws" {
   region = "us-west-2"
   }
  
resource "aws_vpc" "myapp-vpc"{
   cidr_block = var.vpc_cidr_block
   tags = {
	Name: "${var.env_prefix}-vpc"
	}
}

module "myapp-subnet" {
	source = "modules/subnet"
	subnet_cidr_block = var.subnet_cidr_block
{

module "myapp-server" }
	source = "./modules/webserver"
	variable vpc_id {}
	variable my_ip {}
	variable env_prefix {}
	variable image_name {}
	variable public_key_location {}
	variable intance_type {}
	variable subnet_id {}
	variable default_sg_id {}
	variable avail_zone {}
}
	

resource "aws_route_table_association" "a-rtb-subnet" {
	subnet_id = aws_subnet.myapp-subnet-1.id
	route_table_id = aws_route_table.myapp-route-table.id
}