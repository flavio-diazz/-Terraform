resource "aws_vpc" "VPC-01" {
  cidr_block = var.vpc_cidr_block

  tags = var.tags
}

resource "aws_subnet" "SNET-01" {
  vpc_id     = aws_vpc.VPC-01.id
  cidr_block = var.snet_cidr_block

  tags = var.tags
}

resource "aws_internet_gateway" "INT-GTW-01" {
  vpc_id = aws_vpc.VPC-01.id

  tags = var.tags
}

resource "aws_route_table" "RTB-01" {
  vpc_id = aws_vpc.VPC-01.id

  route {
    cidr_block = var.rtb_cidr_block
    gateway_id = aws_internet_gateway.INT-GTW-01.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "RTB-ASSOC-01" {
  subnet_id      = aws_subnet.SNET-01.id
  route_table_id = aws_route_table.RTB-01.id
}

/*resource "aws_security_group" "SEC-GROUP-01" {
  name   = var.sec_group_name
  vpc_id = aws_vpc.VPC-01.id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}*/

resource "aws_security_group" "SEC-GROUP-01" {
  name   = var.sec_group_name
  vpc_id = aws_vpc.VPC-01.id

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = var.tags
} 
