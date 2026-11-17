# Variables de entrada para el módulo de red
# Requisitos:
# - Variable para el CIDR de la VPC
# - Variables para los CIDRs de las subnets públicas y privadas
# - Variables para las AZs donde se crearán las subnets
# - Variables para las IPs autorizadas en los security groups

variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
  default     = "notifications"
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDRs para subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de AZs donde se crearán las subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "allowed_ssh_ips" {
  description = "Lista de IPs autorizadas para acceso SSH"
  type        = list(string)
  default     = []
}