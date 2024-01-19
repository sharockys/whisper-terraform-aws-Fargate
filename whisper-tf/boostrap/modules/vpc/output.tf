
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# subnet 
output "public_subnet_id" {
  value = aws_subnet.subnet_public.id
}

output "private_subnet_id" {
  value = aws_subnet.subnet_private.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id

}

output "eip_id" {
  value = aws_eip.eip.id
}
