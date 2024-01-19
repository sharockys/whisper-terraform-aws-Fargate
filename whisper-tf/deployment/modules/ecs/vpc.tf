resource "aws_vpc" "whisper_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "whisper_subnet_1" {
  vpc_id     = aws_vpc.whisper_vpc.id
  cidr_block = "10.0.1.0/24"
  # availability_zone       = var.region
  map_public_ip_on_launch = true
}

resource "aws_subnet" "whisper_subnet_2" {
  vpc_id     = aws_vpc.whisper_vpc.id
  cidr_block = "10.0.2.0/24"
  # availability_zone       = var.region
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.whisper_vpc.id
}

resource "aws_route_table" "whisper_route_table" {
  vpc_id = aws_vpc.whisper_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }
}
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.whisper_subnet_1.id
  route_table_id = aws_route_table.whisper_route_table.id
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.whisper_subnet_2.id
  route_table_id = aws_route_table.whisper_route_table.id
}
