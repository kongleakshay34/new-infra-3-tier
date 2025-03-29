# Create a Route Table for web-subnets
resource "aws_route_table" "swiggy-web-rt" {
  vpc_id = aws_vpc.swiggy-vpc.id
  tags = {
    Name = "swiggy-web-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.swiggy-igw.id
  }
}

# Create a Route Table for app-subnets
resource "aws_route_table" "swiggy-app-rt" {
  vpc_id = aws_vpc.swiggy-vpc.id
  tags = {
    Name = "swiggy-app-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.swiggy-natgw-01.id
  }
}

# Route Table Association of web-subnet-1
resource "aws_route_table_association" "swiggy-rt-as-1" {
  subnet_id      = aws_subnet.swiggy-pub-sub-1.id
  route_table_id = aws_route_table.swiggy-web-rt.id
}

# Route Table Association of web-subnet-2
resource "aws_route_table_association" "swiggy-rt-as-2" {
  subnet_id      = aws_subnet.swiggy-pub-sub-2.id
  route_table_id = aws_route_table.swiggy-web-rt.id
}

# Route Table Association of app-subnet-1
resource "aws_route_table_association" "swiggy-rt-as-3" {
  subnet_id      = aws_subnet.swiggy-pvt-sub-1.id
  route_table_id = aws_route_table.swiggy-app-rt.id
}

# Route Table Association of app-subnet-2
resource "aws_route_table_association" "swiggy-rt-as-4" {
  subnet_id      = aws_subnet.swiggy-pvt-sub-2.id
  route_table_id = aws_route_table.swiggy-app-rt.id
}

# Route Table Association of db-subnet-1
resource "aws_route_table_association" "swiggy-rt-as-5" {
  subnet_id      = aws_subnet.swiggy-pvt-sub-3.id
  route_table_id = aws_route_table.swiggy-app-rt.id
}
# Route Table Association of db-subnet-2
resource "aws_route_table_association" "swiggy-rt-as-6" {
  subnet_id      = aws_subnet.swiggy-pvt-sub-4.id
  route_table_id = aws_route_table.swiggy-app-rt.id
}

# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "swiggy-nat-eip" {
  domain = "vpc"
  tags = {
    Name = "swiggy-nat-eip"
  }
}

