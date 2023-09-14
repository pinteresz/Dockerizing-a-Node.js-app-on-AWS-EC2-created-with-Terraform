# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

# Create a VPC
resource "aws_vpc" "this" { 
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "esz VPC"
  }
}

# Attach IGW to VPC
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

# Create a subnet
resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "esz VPC subnet"
  }
}

# Create a custom route table
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "esz VPC route table"
  }
}

# Associate the custom route table with the subnet
resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

# Create an EC2 instance in the subnet
resource "aws_instance" "this2" {
  ami           = "ami-065681da47fb4e433" 
  instance_type = "t3.micro"           
  subnet_id     = aws_subnet.this.id

  tags = {
    Name = "esz EC2"
  }

  vpc_security_group_ids      = [aws_security_group.this.id]
  key_name                    = "esz-terraform"
  associate_public_ip_address = true
}

# Create SG
resource "aws_security_group" "this" {
  name_prefix = "esz-security-group-"
  description = "esz SG"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "Disallow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow my IP to SSH into EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["89.134.0.230/32"]
  }

  egress {
    description = "Allow outbound HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  egress {
      description = "Allow outbound HTTPS traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

}
