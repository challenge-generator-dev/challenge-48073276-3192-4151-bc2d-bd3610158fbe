# Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones

El objetivo de este reto es aprovisionar la red y el computo del servicio de notificaciones utilizando Terraform, versionando la infraestructura y cumpliendo con las restricciones especificadas. Se trabajará con AWS como proveedor de servicios en la nube.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Stack

- **Lenguaje:** HCL
- **Framework:** Terraform
- **Version:** 1.5+

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Tener el proyecto base del reto funcionando en tu máquina: clonar el repositorio, instalar las herramientas y verificar que compila y arranca antes de empezar a practicar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Instala las herramientas para ejecutar el proyecto: Terraform 1.5+.
- Clona el repositorio del reto (el enlace viene en la entrega del reto y en la sección "Repositorio del Proyecto" del PDF) y ábrelo en tu IDE.
- Instala las dependencias y compila ejecutando `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate` en la raíz del repositorio.
- Confirma que el comando termina sin errores: el proyecto arranca y sus pruebas corren.
- Ubica los archivos de práctica: son los que contienen `TODO(reto)` (búscalos en el repositorio). Lee el README.md y el AGENTS.md antes de empezar.

**Entregable:** El proyecto compila/arranca sin errores con `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate`.

<details>
<summary>Pistas de conocimiento</summary>

- Los archivos con `TODO(reto)` son el ejercicio: el resto del repositorio ya está resuelto y no hace falta tocarlo.
- Si el comando de verificación falla, revisa la versión de las herramientas instaladas antes de modificar código.
- AGENTS.md describe el reto, el comando de verificación y las reglas del repositorio.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura del servicio de notificaciones.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Crear el archivo `main.tf` en el componente `app` con la configuración del proveedor AWS y la definición de workspaces para `dev` y `prod`.
- Asegurar que el workspace actual (`terraform.workspace`) se use para determinar el entorno.
- Validar que la configuración inicial no contenga `local-exec` provisioners.
- Verificar que la configuración inicial sea válida mediante `terraform init` y `terraform validate`.

**Entregable:** Archivo de configuración inicial de Terraform con proveedor AWS y workspaces definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de Terraform para la gestión de infraestructura como código.
- Configuración de proveedores en Terraform.

</details>

### Fase 2: Definición de recursos de red y computo

**Objetivo:** Definir los recursos de red y computo necesarios para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear los recursos de red necesarios para el servicio de notificaciones (VPC, subredes, grupos de seguridad, etc.).
- Crear los recursos de computo necesarios para el servicio de notificaciones (instancias EC2, grupos de autoescalado, etc.).
- Etiquetar todos los recursos con los tags Project y Environment.

**Entregable:** Recursos de red y computo definidos en Terraform y etiquetados correctamente.

<details>
<summary>Pistas de conocimiento</summary>

- Definición de recursos en Terraform.
- Uso de etiquetas en recursos de Terraform.

</details>

### Fase 3: Aprovisionamiento y validación de la infraestructura

**Objetivo:** Aprovisionar la infraestructura definida en Terraform y validar su correcto funcionamiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar `terraform apply` para aprovisionar la infraestructura en el workspace correspondiente.
- Validar que todos los recursos aprovisionados cumplan con los tags `Project` y `Environment` mediante pruebas automatizadas (`terraform test`).
- Verificar que la infraestructura funcione correctamente mediante pruebas de conectividad y acceso.

**Entregable:** Infraestructura aprovisionada y validada mediante pruebas automatizadas de Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Ejecución de planes de Terraform.
- Validación del funcionamiento de la infraestructura aprovisionada.
- Realización de pruebas de integración en Terraform.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el aprovisionamiento de infraestructura?
- **paraQueSirve**: ¿Para qué sirve la configuración de workspaces en Terraform y cómo se utilizan en este reto?
- **comoSeUsa**: ¿Cómo se definen y gestionan los recursos de red y computo en Terraform?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de infraestructura con Terraform y cómo se toman en este reto?

## Criterios de Evaluacion

- Configuración correcta del entorno de Terraform.
- Definición adecuada de los recursos de red y computo.
- Etiquetado correcto de los recursos con los tags Project y Environment.
- Aprovisionamiento y validación exitosa de la infraestructura.
- Cumplimiento de las restricciones especificadas en el reto.

## Mapa de fases

La **Fase 0** es clonar el repositorio, instalar dependencias y correr las pruebas de aceptacion: todas fallan porque la logica de cada pieza esta pendiente.

| Fase | Pieza (skill) | Archivo:simbolo | Criterios | Prueba | Comando |
|------|---------------|-----------------|-----------|--------|---------|
| f1 — Configuración inicial de Terraform | Configuración inicial de proveedores y workspaces en Terraform | — | El proyecto Terraform está configurado con el proveedor AWS y workspaces para `dev` y `prod`.; La configuración inicial es válida y puede inicializarse sin errores. | — | — |
| f2 — Definición de recursos de red y computo | Definición de recursos de red en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f2 — Definición de recursos de red y computo | Definición de recursos de computo en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f2 — Definición de recursos de red y computo | Mapeo de tags para recursos en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f3 — Aprovisionamiento y validación de la infraestructura | Validación de infraestructura con pruebas automatizadas | — | La infraestructura se aprovisiona correctamente en AWS.; Todos los recursos aprovisionados cumplen con los tags requeridos.; La infraestructura es funcional y accesible. | — | — |

## Pruebas de aceptacion

Las pruebas de aceptacion (columna "Prueba" de la tabla) son de **solo lectura**: definen que significa "listo". No las edites, no las borres y no les agregues `skip`; lo que se resuelve es el codigo de cada pieza.

## Restricciones del pedido

| Restriccion | Donde se cumple | Estado |
|-------------|-----------------|--------|
| Usar workspaces de Terraform para separar dev y prod (terraform.workspace en el codigo) | chequeo estatico (code): exige `terraform.workspace` | Verificada |
| No usar provisioners local-exec | chequeo estatico (code): prohibe `local-exec` | Verificada |
| Etiquetar todos los recursos con los tags Project y Environment (verificado por terraform test) | sin ubicar | Restriccion no verificada en sin ubicar |

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
