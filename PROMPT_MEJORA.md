# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Como saber que terminaste

```bash
terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura del servicio de notificaciones. — entregable (NO resolver): Archivo de configuración inicial de Terraform con proveedor AWS y workspaces definidos.
- Fase 2: Definición de recursos de red y computo — objetivo: Definir los recursos de red y computo necesarios para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Recursos de red y computo definidos en Terraform y etiquetados correctamente.
- Fase 3: Aprovisionamiento y validación de la infraestructura — objetivo: Aprovisionar la infraestructura definida en Terraform y validar su correcto funcionamiento. — entregable (NO resolver): Infraestructura aprovisionada y validada mediante pruebas automatizadas de Terraform.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: modules/network/main.tf ===
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

// === ARCHIVO: modules/network/variables.tf ===
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

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de cómputo para el servicio de notificaciones
# TODO(reto): Implementar la configuración de recursos computacionales
# Requisitos:
# - Crear un Auto Scaling Group con instancias EC2 para el servicio de notificaciones
# - Configurar un Load Balancer para distribuir el tráfico
# - Usar AMI oficial de Amazon Linux 2
# - Configurar security groups para permitir tráfico HTTP/HTTPS
# - Implementar políticas de escalado basadas en CPU
# - Configurar health checks para las instancias

# TODO(reto): implementa este bloque
# resource "aws_launch_template" "notifications_lt" {
# }

# TODO(reto): implementa este bloque
# resource "aws_autoscaling_group" "notifications_asg" {
# }

// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: variables.tf ===
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

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del módulo de red
# Superficie de práctica: el estudiante debe definir los outputs del módulo

# TODO(reto): Exponer el ID de la VPC creada
# 参考: aws_vpc.notifications_vpc.id

# TODO(reto): Exponer los IDs de las subnets públicas
# 参考: aws_subnet.public[*].id

# TODO(reto): Exponer los IDs de las subnets privadas
# 参考: aws_subnet.private[*].id

# TODO(reto): Exponer el ID del security group
# 参考: aws_security_group.main.id

// === ARCHIVO: modules/compute/outputs.tf ===
# Outputs del módulo de cómputo
# Superficie de práctica: el estudiante debe definir los outputs del módulo

# TODO(reto): Exponer el ID del launch template
# 参考: aws_launch_template.notifications_lt.id

# TODO(reto): Exponer el ID del autoscaling group
# 参考: aws_autoscaling_group.notifications_asg.id

# TODO(reto): Exponer el ID de la instancia de cómputo (consumido de modules/compute/main.tf)
# 参考: compute_instance_id de aws_instance o aws_launch_template

// === ARCHIVO: main.tf ===
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

// === ARCHIVO: outputs.tf ===
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
```
