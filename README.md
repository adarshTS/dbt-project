# dbt Project

## Overview

This project uses **dbt** to transform data in **Snowflake** into analytics-ready models. The dbt project contains customer and order, payment related transformations sourced from the database through a database pipeline created from hevo, along with dbt tests.


## Prerequisites

Before running the project, make sure you have:

* Access to the Snowflake account used by the project.
* Snowflake warehouse, database, and schema configured for the project.
* dbt project in the Snowflake Workspace.
* The required source data available in Snowflake.
* Appropriate Snowflake permissions to create and query the required objects.

### Models

The `models/` directory contains the dbt transformation models.

* `customers.sql` - It contains the SQL transformation that takes the source data and produces the final customers table in Snowflake.
* `sources.yml` - This was to define where the source data comes from.

### Tests

The project contains both generic dbt tests and a custom singular test.

The tests include:

* `CUSTOMER_ID` must not be null.
* `CUSTOMER_ID` must be unique.
* `FIRST_NAME` must not be null.
* Customers with no first order must have no most recent order, zero orders, and zero customer lifetime value.

The singular test is located in:

```text
tests/customer_metrics_consistency.sql
```


## Build and Run the Project

### 1. Open the dbt project

Open the project in **Snowflake Workspaces**.

Verify that `dbt_project.yml` is present at the project root.

### 2. Configure the dbt environment

The project uses `env.yml` for environment-specific configuration.

The available environments are:

```text
dev
prod
```

Select the dev before executing the dbt project.

### 3. Build the dbt models

Run the dbt project using the **Run** operation in the Workspace.

This creates or updates the models defined in the `models/` directory in Snowflake.

### 4. Run the dbt tests

After the models have been built, execute the **Test** operation.


The project should discover the configured data tests and execute them.

A successful run should report:

```text
PASS=4
ERROR=0
WARN=0
SKIP=0
```
