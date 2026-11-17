# Outputs del componente raíz
# Expone los valores de los módulos para consumo externo

# Output del módulo de red
output "vpc_id" {
  description = "ID de la VPC creada por el módulo de red"
  value       = module.network_module.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network_module.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network_module.private_subnet_ids
}

output "security_group_id" {
  description = "ID del security group creado por el módulo de red"
  value       = module.network_module.security_group_id
}

# Output del módulo de compute
output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute_module.asg_name
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = module.compute_module.launch_template_id
}

# TODO(reto): Completar los outputs del componente raíz
# - Verificar que todos los outputs referenciados están expuestos por los módulos
# - Asegurar que vpc_id, public_subnet_ids, private_subnet_ids y security_group_id están disponibles en network_module
# - Asegurar que asg_name y launch_template_id están disponibles en compute_module
# - Agregar outputs adicionales si son necesarios para el servicio de notificaciones