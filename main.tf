provider "aws" {
   region = "us-east-2"
   access_key = "AKIA6GBMHDARAOKMLKXB"
   secret_key = "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"
   }

resource "aws_vpc" "development-vpc"{
   cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev-subnet-1"{
   vpc_id = aws_vpc.development-vpc.id
   cidr_block = "10.0.10.0/24"
   availability_zone = "us-east-2a"
}
   