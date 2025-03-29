# WEB-SERVER PUBLIC-SUBNET-1
resource "aws_subnet" "swiggy-pub-sub-1" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.0/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "swiggy-pub-sub-1"
  }
}

# WEB-SERVER PUBLIC-SUBNET-2
resource "aws_subnet" "swiggy-pub-sub-2" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.16/28"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "swiggy-pub-sub-2"
  }
}

# APP-SERVER PRIVATE-SUBNET-1
resource "aws_subnet" "swiggy-pvt-sub-1" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.32/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "swiggy-app-sub-1"
  }
}

# APP-SERVER PRIVATE-SUBNET-2
resource "aws_subnet" "swiggy-pvt-sub-2" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.48/28"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "swiggy-app-sub-2"
  }
}

# DB-SERVER PRIVATE-SUBNET-1
resource "aws_subnet" "swiggy-pvt-sub-3" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.64/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "swiggy-db-sub-1"
  }
}

# DB-SERVER PRIVATE-SUBNET-2
resource "aws_subnet" "swiggy-pvt-sub-4" {
  vpc_id                  = aws_vpc.swiggy-vpc.id
  cidr_block              = "10.0.0.80/28"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "swiggy-db-sub-2"
  }
}

