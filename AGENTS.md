# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones**.

| | |
|---|---|
| Tema | Infraestructura como codigo con Terraform |
| Nivel | advanced-l2 |
| Chapter | DevSecOps |
| Especialidad | DevSecOps |
| Stack | HCL / Terraform |
| Patron arquitectonico | infraestructura como código con módulos y workspaces |
| Tiempo estimado | 8 horas |

## Receta del stack

Esqueleto obligatorio:

- `azure-pipelines.yml o .github/workflows/*.yml con stages reales`
- `Dockerfile multi-stage`
- `.dockerignore`
- `main.tf, variables.tf y outputs.tf de Terraform en la raiz del proyecto`
- `environments/{env}/terraform.tfvars`
- `scripts/ con los scripts de build y healthcheck`
- `sonar-project.properties`

Trampas conocidas:

- `required_version` de Terraform va como RANGO (`>= 1.5`), nunca exacto: pineado, el proyecto no corre con otra version instalada.
- Los providers tambien con restriccion flexible (`~> 5.0`).
- El Dockerfile multi-stage necesita que la etapa final copie el artefacto de la etapa de build, no el codigo fuente.

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración inicial de Terraform**: Archivo de configuración inicial de Terraform con proveedor AWS y workspaces definidos.
- **Fase 2 — Definición de recursos de red y computo**: Recursos de red y computo definidos en Terraform y etiquetados correctamente.
- **Fase 3 — Aprovisionamiento y validación de la infraestructura**: Infraestructura aprovisionada y validada mediante pruebas automatizadas de Terraform.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de fases

La **Fase 0** es clonar el repositorio, instalar dependencias y correr las pruebas de aceptacion: todas fallan porque la logica de cada pieza esta pendiente.

| Fase | Pieza (skill) | Archivo:simbolo | Criterios | Prueba | Comando |
|------|---------------|-----------------|-----------|--------|---------|
| f1 — Configuración inicial de Terraform | Configuración inicial de proveedores y workspaces en Terraform | — | El proyecto Terraform está configurado con el proveedor AWS y workspaces para `dev` y `prod`.; La configuración inicial es válida y puede inicializarse sin errores. | — | — |
| f2 — Definición de recursos de red y computo | Definición de recursos de red en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f2 — Definición de recursos de red y computo | Definición de recursos de computo en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f2 — Definición de recursos de red y computo | Mapeo de tags para recursos en Terraform | — | Los recursos de red y computo están definidos en Terraform y etiquetados correctamente.; Los recursos incluyen VPC, subredes, grupos de seguridad y instancias de computo.; Todos los recursos tienen los tags `Project` y `Environment` basados en el workspace. | — | — |
| f3 — Aprovisionamiento y validación de la infraestructura | Validación de infraestructura con pruebas automatizadas | — | La infraestructura se aprovisiona correctamente en AWS.; Todos los recursos aprovisionados cumplen con los tags requeridos.; La infraestructura es funcional y accesible. | — | — |

## Pruebas de aceptacion y ubicacion de la logica

Las pruebas de aceptacion (columna "Prueba" de la tabla) son de **solo lectura**: definen que significa "listo". No las edites, no las borres y no les agregues `skip`; lo que se resuelve es el codigo de cada pieza.

La logica de cada pieza va en su archivo; no la muevas a otro.

## Restricciones del pedido

| Restriccion | Donde se cumple | Estado |
|-------------|-----------------|--------|
| Usar workspaces de Terraform para separar dev y prod (terraform.workspace en el codigo) | chequeo estatico (code): exige `terraform.workspace` | Verificada |
| No usar provisioners local-exec | chequeo estatico (code): prohibe `local-exec` | Verificada |
| Etiquetar todos los recursos con los tags Project y Environment (verificado por terraform test) | sin ubicar | Restriccion no verificada en sin ubicar |

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (11)

- `versions.tf`
- `providers.tf`
- `modules/network/main.tf`
- `modules/network/variables.tf`
- `modules/compute/main.tf`
- `modules/compute/variables.tf`
- `variables.tf`
- `modules/network/outputs.tf`
- `modules/compute/outputs.tf`
- `main.tf`
- `outputs.tf`

### Capas del patron declarado

Son las capas que la propuesta arquitectonica plantea, marcadas segun existan hoy en el repo. Orientan donde poner el codigo nuevo; no son una condicion para compilar.

- `modules/network` (presente)
- `modules/compute` (presente)
- `environments/dev` (ausente)
- `environments/prod` (ausente)
- `test` (ausente)

## Verificacion

```bash
terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **infraestructura como código con módulos y workspaces**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2
- Brecha que el reto ataca: Aprovisionar infraestructura con Terraform
- Mision: Versionar la infraestructura del servicio de notificaciones

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
