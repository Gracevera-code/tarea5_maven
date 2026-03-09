# Tarea 5 - Proyecto dbt con arquitectura por capas

## Descripción

Este repositorio contiene la solución de la **Tarea 5** del módulo de **Integración de Datos**, cuyo objetivo fue construir un proyecto **dbt** completo a partir de datos cargados desde archivos CSV del caso **Maven Fuzzy Factory**.

El proyecto fue desarrollado siguiendo una arquitectura de tres capas:

- **staging**
- **intermediate**
- **mart**

Además, se configuraron las fuentes (`sources`), pruebas de calidad (`data tests`) y la documentación del proyecto con `dbt docs`.

---

## Objetivo de la tarea

Construir un proyecto dbt que cumpla con los siguientes puntos:

1. Proyecto dbt inicializado y configurado  
2. Al menos 2 modelos staging  
3. Al menos 1 modelo intermediate  
4. Al menos 1 modelo mart  
5. Archivo `_sources.yml` configurado  
6. Captura del DAG generado por `dbt docs`  

---

## Tecnologías utilizadas

- **dbt Core**
- **dbt-duckdb**
- **DuckDB / MotherDuck**
- **Git**
- **GitHub**

---

## Fuente de datos

Se trabajó con el dataset **Maven Fuzzy Factory**, compuesto por los siguientes archivos CSV:

- `orders.csv`
- `website_sessions.csv`
- `order_items.csv`
- `order_item_refunds.csv`
- `products.csv`
- `website_pageviews.csv`

Estas tablas fueron cargadas en la base `airbyte_curso_gv`, dentro del esquema:

- `raw_maven`

---

## DAG generado con dbt docs

DAG del proyecto

A continuación se presenta la captura del DAG generado con dbt docs, donde se observa el flujo de dependencias entre fuentes, modelos staging, modelo intermediate y modelo mart.

![DAG del proyecto](dag_tarea5_maven.png)

---


## Arquitectura de modelos
1. Staging

En esta capa se definieron los modelos base a partir de las tablas fuente, realizando renombrado y organización inicial de columnas.

##Modelos implementados:

stg_maven__orders

stg_maven__website_sessions

2. Intermediate

En esta capa se construyó un modelo intermedio para integrar información de pedidos y sesiones web.

## Modelo implementado:

int_maven__orders_with_sessions

3. Mart

En esta capa se construyó una tabla final orientada al análisis, con una vista consolidada de órdenes y datos de sesión.

## Modelo implementado:

mart_maven__orders_obt

Sources configurados

## El proyecto utiliza el archivo:

models/staging/maven/_sources.yml

con la definición de las tablas fuente dentro del esquema raw_maven.

## Fuentes declaradas:

orders

website_sessions

order_items

products

website_pageviews

order_item_refunds

## Tests implementados

Se configuraron pruebas de calidad sobre columnas clave, principalmente:

not_null

unique

## Estas pruebas fueron aplicadas sobre:

order_id

website_session_id

## La ejecución de pruebas se realizó con:

dbt test

## Ejecución del proyecto
1. Validar configuración
dbt debug
2. Ejecutar modelos de staging
dbt run --select path:models/staging
3. Ejecutar modelos intermedios
dbt run --select path:models/intermediate
4. Ejecutar modelo mart
dbt run --select path:models/marts
5. Ejecutar pruebas
dbt test
6. Generar documentación
dbt docs generate
7. Visualizar documentación y DAG
dbt docs serve
## Resultado

El proyecto cumple con los requerimientos de la tarea:

proyecto dbt configurado correctamente

2 modelos staging

1 modelo intermediate

1 modelo mart

archivo _sources.yml implementado

pruebas ejecutadas correctamente


---


## Estructura del proyecto

```text
tarea5_maven/
├── dbt_project.yml
├── README.md
├── dag_tarea5_maven.png
├── models/
│   ├── staging/
│   │   └── maven/
│   │       ├── _sources.yml
│   │       ├── _staging_models.yml
│   │       ├── stg_maven__orders.sql
│   │       └── stg_maven__website_sessions.sql
│   ├── intermediate/
│   │   └── maven/
│   │       ├── _intermediate_models.yml
│   │       └── int_maven__orders_with_sessions.sql
│   └── marts/
│       └── maven/
│           ├── _mart_models.yml
│           └── mart_maven__orders_obt.sql

```

---


# Tarea 6 - Validaciones, documentación y calidad en dbt

## Descripción

Este repositorio contiene la continuación de la **Tarea 5** del módulo de **Integración de Datos**, incorporando validaciones adicionales, documentación más completa y pruebas avanzadas sobre el proyecto dbt desarrollado con el dataset **Maven Fuzzy Factory**.

En esta tarea se amplió el proyecto con:

- instalación de `dbt-expectations`
- mayor cobertura de pruebas genéricas
- pruebas avanzadas con `dbt-expectations`
- pruebas singulares personalizadas
- documentación de modelos y columnas clave
- validación integral del proyecto con `dbt build`

---

## Objetivo de la tarea

Actualizar el repositorio Git del proyecto dbt para cumplir con los siguientes puntos:

1. `dbt-expectations` instalado (`packages.yml` + `dbt deps`)
2. Al menos 5 tests genéricos
3. Al menos 3 tests de `dbt-expectations`
4. Al menos 2 singular tests personalizados
5. Documentación de todos los modelos y columnas clave
6. Captura del DAG con documentación generada

Todos los tests debían pasar correctamente con:

bash
dbt build
Tecnologías utilizadas

dbt Core

dbt-duckdb

DuckDB / MotherDuck

dbt-expectations

Git

GitHub


## Fuente de datos

Se trabajó con el dataset Maven Fuzzy Factory, compuesto por los siguientes archivos CSV:

orders.csv

website_sessions.csv

order_items.csv

order_item_refunds.csv

products.csv

website_pageviews.csv

Estas tablas fueron cargadas en la base airbyte_curso_gv, dentro del esquema:

raw_maven

```text
Estructura del proyecto
tarea5_maven/
├── dbt_project.yml
├── packages.yml
├── package-lock.yml
├── README.md
├── dag_tarea6_maven.png
├── models/
│   ├── staging/
│   │   └── maven/
│   │       ├── _sources.yml
│   │       ├── _staging_models.yml
│   │       ├── stg_maven__orders.sql
│   │       └── stg_maven__website_sessions.sql
│   ├── intermediate/
│   │   └── maven/
│   │       ├── _intermediate_models.yml
│   │       └── int_maven__orders_with_sessions.sql
│   └── marts/
│       └── maven/
│           ├── _mart_models.yml
│           └── mart_maven__orders_obt.sql
├── tests/
│   ├── assert_mart_rowcount_matches_intermediate.sql
│   └── assert_mart_rowcount_matches_staging_orders.sql

```
---

## Arquitectura del proyecto
1. Staging

En esta capa se definieron modelos base a partir de las tablas fuente, realizando renombrado de columnas, organización inicial y validaciones de calidad.

Modelos implementados:

stg_maven__orders

stg_maven__website_sessions

2. Intermediate

En esta capa se construyó un modelo intermedio para integrar información de órdenes y sesiones web.

Modelo implementado:

int_maven__orders_with_sessions

3. Mart

En esta capa se construyó una tabla final tipo OBT para análisis, consolidando atributos de órdenes y sesiones.

Modelo implementado:

mart_maven__orders_obt

## Sources configurados

El proyecto utiliza el archivo:

models/staging/maven/_sources.yml

con la definición de las tablas fuente dentro del esquema raw_maven.

## Fuentes declaradas:

orders

website_sessions

order_items

products

website_pageviews

order_item_refunds

## Instalación de dbt-expectations

Se agregó el paquete dbt-expectations mediante el archivo:

packages.yml

y se instaló con:

dbt deps

Esto permitió incorporar validaciones adicionales sobre rangos y consistencia de valores.

Tests implementados
Tests genéricos

## Se configuraron tests genéricos como:

not_null

unique

## Aplicados sobre columnas clave como:

order_id

website_session_id

order_created_at

price_usd

cogs_usd

items_purchased

## Tests de dbt-expectations

Se implementaron pruebas avanzadas con dbt-expectations, por ejemplo:

expect_column_values_to_be_between sobre order_id

expect_column_values_to_be_between sobre items_purchased

expect_column_values_to_be_between sobre price_usd

expect_column_values_to_be_between sobre cogs_usd

expect_column_values_to_be_between sobre website_session_id

## Singular tests personalizados

Se crearon los siguientes singular tests:

assert_mart_rowcount_matches_intermediate.sql

assert_mart_rowcount_matches_staging_orders.sql

Estos validan que la cantidad de registros del modelo mart sea consistente con los modelos upstream utilizados.

## Documentación

Se documentaron todos los modelos implementados y sus columnas clave en los archivos:

models/staging/maven/_staging_models.yml

models/intermediate/maven/_intermediate_models.yml

models/marts/maven/_mart_models.yml

La documentación incluye:

descripción funcional del modelo

descripción de columnas relevantes

definición de pruebas asociadas

## Ejecución del proyecto
1. Instalar dependencias
dbt deps
2. Validar configuración
dbt debug
3. Ejecutar construcción completa del proyecto
dbt build
4. Generar documentación
dbt docs generate
5. Visualizar documentación y DAG
dbt docs serve

## Resultado

El proyecto cumple con los requerimientos de la tarea 6:

dbt-expectations instalado correctamente

más de 5 tests genéricos implementados

al menos 3 tests de dbt-expectations

2 singular tests personalizados

documentación de modelos y columnas clave

nueva captura del DAG generada

ejecución exitosa de dbt build

Resultado de validación final:

dbt build

PASS = 28
WARN = 0
ERROR = 0

DAG del proyecto

A continuación se presenta la captura del DAG actualizado con la documentación generada en dbt Docs.
![DAG del proyecto](dag_tarea6_maven.png)
