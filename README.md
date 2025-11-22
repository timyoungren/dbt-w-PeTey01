# dbt Learning Project — Tim Youngren

This repository contains my structured learning project for dbt (data build tool).  
The goal is to develop a modern analytics engineering skillset by working through a week-by-week plan covering modeling, testing, documentation, governance, and best practices using **dbt Core** with **BigQuery**.

## Serve
- dbt docs serve --port 8001

---

## 📁 Project Structure
.
├── models/ # dbt models (SQL + YAML documentation)
│ └── example/ # early learning models
├── seeds/ # CSVs loaded as raw tables in BigQuery
├── macros/ # Custom Jinja tests
├── dbt_project.yml # Core project configuration
└── schema.yml # Tests, sources, documentation


---

## 🎯 Learning Goals: Weeks 1–2

### ✔ Week 1 — Foundations
- Installed dbt Core & BigQuery CLI tools  
- Connected dbt to BigQuery  
- Built first dbt model (`my_first_dbt_model`)  
- Learned materializations, refs, DAG concepts  
- Ran: `dbt run`, `dbt test`, `dbt docs generate`

### ✔ Week 2 — Treat Analytics Like Software
- Added **schema tests**:  
  - `unique`, `not_null`, `accepted_values`, `relationships`
- Introduced **source definitions** (`raw.customers`, `raw.orders`)
- Implemented **freshness checks** with TIMESTAMP casting
- Created **custom generic tests** with Jinja:
  - `no_future_dates`
  - `no_duplicate_values`
- Generated and served documentation with lineage graphs
- Added `.gitignore` and version-controlled everything with GitHub

---

## 🧪 Data Quality & Testing Strategy

This project demonstrates a multi-layer testing and governance approach:

### 1. **Built-In dbt Tests**
- `unique`
- `not_null`
- `accepted_values`
- `relationships`

These ensure entity integrity, null protection, referential integrity, and domain enforcement.

### 2. **Source Freshness**
Each raw table includes:

```yaml
loaded_at_field: "CAST(order_date AS TIMESTAMP)"
freshness:
  warn_after: {count: X, period: day}
  error_after: {count: Y, period: day}


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## 👤 Author

**Tim Youngren**  
Business Intelligence & Data Solutions Consultant  
Learning dbt to modernize analytics workflows and strengthen analytics engineering skills.
