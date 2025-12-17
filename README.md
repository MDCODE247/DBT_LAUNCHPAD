# CowJacket dbt Analytics Project

## Project Overview

This project implements a **complete analytics engineering pipeline**
using **dbt Cloud** with **Snowflake** as the data warehouse.\
The pipeline follows dbt best practices with a **three-layer modeling
approach**: `staging`, `intermediate`, and `marts`, producing clean,
tested, and analytics-ready tables.

The project demonstrates how raw transactional data can be transformed
into **business-friendly fact and dimension tables** suitable for
reporting and dashboards.

------------------------------------------------------------------------

## Project Structure

    models/
    └── cowjacket/
        ├── staging/          # Cleaned raw source data
        ├── intermediate/     # Business logic & aggregations
        └── marts/            # Final analytics tables

Additional project files:

    dbt_project.yml
    packages.yml
    README.md

------------------------------------------------------------------------

## Modeling Layers

### Staging Layer (`staging`)

-   Materialized as **views**
-   One-to-one representations of raw tables
-   Handles:
    -   Column renaming
    -   Data type standardization
    -   Basic data cleaning
-   Uses `source()` to reference raw Snowflake tables

------------------------------------------------------------------------

### Intermediate Layer (`intermediate`)

-   Materialized as **views**
-   Applies business logic and transformations
-   Combines staging models using joins and aggregations
-   Examples:
    -   Customer-level order history
    -   Revenue per order
    -   Aggregated loyalty points

------------------------------------------------------------------------

### Marts Layer (`marts`)

-   Materialized as **tables**
-   Analytics-ready models designed for consumption
-   Includes:
    -   **Dimension tables** (e.g. customers)
    -   **Fact tables** (e.g. customer orders)
-   Uses only `ref()` to upstream intermediate models

------------------------------------------------------------------------

## Core Data Models

### Dimensions

-   **dim_customers**
    -   One row per customer
    -   Includes customer attributes and total loyalty points

### Facts

-   **fact_customer_orders**
    -   One row per customer
    -   Metrics include:
        -   Total orders
        -   Total revenue
        -   Last order date

------------------------------------------------------------------------

## Data Quality & Testing

The project includes built-in dbt tests to ensure data quality:

-   `not_null` tests on primary keys
-   `unique` tests on identifiers
-   Relationship tests between fact and dimension tables
-   Source freshness checks (where applicable)

Run tests with:

``` bash
dbt test
```

------------------------------------------------------------------------

## Documentation & Lineage

dbt documentation is enabled for this project, providing:

-   Model and column-level descriptions
-   Dependency lineage graph (RAW → STAGING → INTERMEDIATE → MARTS)
-   Clear visibility into transformations

Generate documentation with:

``` bash
dbt docs generate
dbt docs serve
```

------------------------------------------------------------------------

## Snowflake Architecture

Schemas used in Snowflake:

  Layer             Schema
  ----------------- ----------------
  Raw               `RAW`
  Staging           `STAGING`
  Intermediate      `INTERMEDIATE`
  Analytics Marts   `ANALYTICS`

------------------------------------------------------------------------

## Running the Project

1.  Install dependencies:

``` bash
dbt deps
```

2.  Run all models:

``` bash
dbt run
```

3.  Run tests:

``` bash
dbt test
```

------------------------------------------------------------------------

## Technologies Used

-   dbt Cloud
-   Snowflake
-   SQL
-   GitHub

----------------------------------------------------------------------
