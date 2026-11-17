# Variables de entrada para el componente raíz del servicio de notificaciones
# Superficie de práctica: el estudiante debe completar la definición de variables

variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
  default     = "notifications"
}

variable "environment" {
  description = "Entorno de despliegue (dev/staging/prod)"
  type        = string
  default     = "dev"
}

# Variables para el módulo de red
variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para las subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "allowed_ssh_ips" {
  description = "IPs permitidas para acceso SSH"
  type        = list(string)
  default     = []
}

# Variables para el módulo de cómputo
variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 4
}

variable "asg_desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
  default     = ""
}

# TODO(reto): Completar las variables necesarias para el módulo de red
# 参考: vpc_cidr, public_subnet_cidrs, private_subnet_cidrs, availability_zones, allowed_ssh_ips

# TODO(reto): Completar las variables necesarias para el módulo de cómputo
# 参考: instance_type, asg_min_size, asg_max_size, asg_desired_capacity, key_name, private_subnet_ids, security_group_id