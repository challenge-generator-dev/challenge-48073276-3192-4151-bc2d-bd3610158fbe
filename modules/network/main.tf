# Módulo de red para el servicio de notificaciones
# Requisitos:
# - Crear una VPC con CIDR 10.0.0.0/16
# - Crear 2 subnets públicas en diferentes AZs con CIDRs 10.0.1.0/24 y 10.0.2.0/24
# - Crear 2 subnets privadas en diferentes AZs con CIDRs 10.0.3.0/24 y 10.0.4.0/24
# - Configurar un Internet Gateway y rutas para las subnets públicas
# - Configurar NAT Gateway para las subnets privadas
# - Crear security groups con reglas para permitir tráfico HTTP/HTTPS y SSH solo desde IPs autorizadas

# Obtener el workspace actual para separar dev y prod
locals {
  environment = terraform.workspace
  common_tags = {
    Project     = var.project_name
    Environment = local.environment
  }
}

# VPC
resource "aws_vpc" "notifications_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    Name = "notifications-vpc-${local.environment}"
  })
}

# Internet Gateway
resource "aws_internet_gateway" "notifications_igw" {
  vpc_id = aws_vpc.notifications_vpc.id

  tags = merge(local.common_tags, {
    Name = "notifications-igw-${local.environment}"
  })
}

# Subnets públicas
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.notifications_vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.common_tags, {
    Name = "notifications-public-subnet-${count.index + 1}-${local.environment}"
  })
}

# Subnets privadas
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.notifications_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.common_tags, {
    Name = "notifications-private-subnet-${count.index + 1}-${local.environment}"
  })
}

# Elastic IP para NAT Gateway
resource "aws_eip" "nat_eip" {
  count  = 1
  domain = "vpc"

  tags = merge(local.common_tags, {
    Name = "notifications-nat-eip-${local.environment}"
  })
}

# NAT Gateway
resource "aws_nat_gateway" "notifications_nat" {
  count         = 1
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(local.common_tags, {
    Name = "notifications-nat-${local.environment}"
  })
}

# Route table para subnets públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.notifications_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.notifications_igw.id
  }

  tags = merge(local.common_tags, {
    Name = "notifications-public-rt-${local.environment}"
  })
}

# Asociación de route table pública
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Route table para subnets privadas
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.notifications_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.notifications_nat[0].id
  }

  tags = merge(local.common_tags, {
    Name = "notifications-private-rt-${local.environment}"
  })
}

# Asociación de route table privada
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Security Group principal
resource "aws_security_group" "main" {
  name        = "notifications-sg-${local.environment}"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.notifications_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "notifications-sg-${local.environment}"
  })
}