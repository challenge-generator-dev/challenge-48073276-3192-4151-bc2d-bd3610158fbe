# Configuración principal del componente raíz
# Consume los módulos de red y computo para aprovisionar la infraestructura

terraform {
  # Workspace basado en el entorno
  # El workspace se selecciona con: terraform workspace select dev|prod
}

# Módulo de red - proporciona VPC, subnets y recursos de red
module "network_module" {
  source = "./modules/network"

  # Variables del módulo de red
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  allowed_ssh_ips      = var.allowed_ssh_ips
}

# Módulo de compute - proporciona ASG y Launch Template
module "compute_module" {
  source = "./modules/compute"

  # Variables del módulo de compute
  instance_type         = var.instance_type
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  asg_desired_capacity  = var.asg_desired_capacity
  key_name              = var.key_name
  private_subnet_ids    = module.network_module.private_subnet_ids
  security_group_id     = module.network_module.security_group_id
}

# TODO(reto): Completar la configuración del componente raíz
# - Asegurar que solo se usan outputs expuestos por los módulos
# - Verificar que private_subnet_ids y security_group_id están disponibles en network_module
# - Agregar recursos adicionales si son necesarios para el servicio de notificaciones