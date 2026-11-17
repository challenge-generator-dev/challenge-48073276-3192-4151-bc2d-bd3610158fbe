# Variables de entrada para el módulo de cómputo
# TODO(reto): Definir variables para parametrizar la configuración de cómputo
# Requisitos:
# - Variable para el tipo de instancia EC2
# - Variable para el tamaño mínimo/máximo/deseado del ASG
# - Variable para el nombre de la key pair
# - Variable para los IDs de las subnets privadas
# - Variable para el ID del security group

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
  description = "Nombre de la key pair para acceso SSH"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas donde se desplegarán las instancias"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID del security group para las instancias"
  type        = string
}