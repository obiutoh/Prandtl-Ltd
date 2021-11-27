# The Main Vpc


resource "aws_vpc" "Assignment-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Assignment-VPC"
  }
}


# The Public Subnet_1


resource "aws_subnet" "Public-Subnet1" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet1"
  }
}


# The Public Subnet_1


resource "aws_subnet" "Public-Subnet2" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Public-Subnet2"
  }
}


# Private Subnet_1


resource "aws_subnet" "Private-Subnet1" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Private-Subnet1"
  }
}


# Private Subnet_2


resource "aws_subnet" "Private-Subnet2" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Private-Subnet2"
  }
}


# Private Subnet_3


resource "aws_subnet" "Private-Subnet3" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "Private-Subnet3"
  }
}


# The Public Route Table


resource "aws_route_table" "Public_Routetable" {
  vpc_id = aws_vpc.Assignment-VPC.id

  

  tags = {
    Name = "Public_Routetable"
  }
}


# The Private Route Table


resource "aws_route_table" "Private_Routetable" {
  vpc_id = aws_vpc.Assignment-VPC.id

  

  tags = {
    Name = "Private_Routetable"
  }
}



# The Public subnet Association with Route_1

resource "aws_route_table_association" "Public-Subnetassoc1" {
  subnet_id      = aws_subnet.Public-Subnet1.id
  route_table_id = aws_route_table.Public_Routetable.id
}


# The Public subnet Association with Route_2

resource "aws_route_table_association" "Public-Subnetassoc2" {
  subnet_id      = aws_subnet.Public-Subnet2.id
  route_table_id = aws_route_table.Public_Routetable.id
}

# The Private subnet Assoc  with Route_1


resource "aws_route_table_association" "Private-Subnetassoc1" {
  subnet_id      = aws_subnet.Private-Subnet1.id
  route_table_id = aws_route_table.Private_Routetable.id
}


# The Private subnet Assoc  with Route_2


resource "aws_route_table_association" "Private-Subnetassoc2" {
  subnet_id      = aws_subnet.Private-Subnet2.id
  route_table_id = aws_route_table.Private_Routetable.id
}


# The Private subnet Assoc  with Route_3


resource "aws_route_table_association" "Private-Subnetassoc3" {
  subnet_id      = aws_subnet.Private-Subnet3.id
  route_table_id = aws_route_table.Private_Routetable.id
}


# The Internet Gateway 


resource "aws_internet_gateway" "GW-Internet1" {
  vpc_id = aws_vpc.Assignment-VPC.id

  tags = {
    Name = "GW-Internet1"
  }
}



# Conection of Route to Internet GW And Route


resource "aws_route" "Public-igw" {
  route_table_id            = aws_route_table.Public_Routetable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.GW-Internet1.id               
}