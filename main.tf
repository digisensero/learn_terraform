# Define the provider
provider "aws" {
    region = "us-west-2"
    profile = "demo"
}
# Create a VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "my_subnet" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
    ami           = "Packer created EF AMI ID"
    instance_type = "t2.large"
    subnet_id     = aws_subnet.my_subnet.id
}
