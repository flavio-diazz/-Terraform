output "vpc_id" {
  value = aws_vpc.VPC-01.id
}

output "snet_id" {
  value = aws_subnet.SNET-01.id
}

output "int_gtw" {
  value = aws_internet_gateway.INT-GTW-01.id
}

output "security_group_id" {
  value = aws_security_group.SEC-GROUP-01.id
}

output "route_table_id" {
  value = aws_route_table.RTB-01.id
}
