# Exploratory Data Analysis w/ SQL: Job Market Analysis 
A SQL project analyzing the data engineer job market using real world job posting data.

## Executive Summary
- **Project Scope:** Built 3 analytical queries that answer key questions about the data engineer job market
- **Data modeling:** Used multi-table joins across fact and dimension tables to extract insights
- **Analytics:** Applied aggregations, filtering, and sorting to find top skills by demand, salary, and overall value
- **Outcomes:** Delivered actionable insights on SQL/Python dominance, cloud trends, and salary patterns

***--> Just show me the queries! (TLDR):*** *[Top Demanded Skills Query](../Project_1/01_top_skills.sql)*, *[Top Paying Skills Query](../Project_1/02_highest_paying_skills.sql)*, *[Optimal Skills Query](../Project_1/03_optimal_skills.sql)*

## Problem & Context
Common questions job market analysts ask are:
- Which skills are most in-demand for data engineers?
- Which skills command the highest salaries?
- What is the optimal skill set balancing demand and compensation?

This project analyzes a **data warehouse** built using a star-schema design. The warehouse structure consists of:

![Data Warehouse](../Images/Data_Warehouse.png)

- **Fact Table:** `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc.)
- **Dimension Tables:** 
    - `company_dim` - Company information linked to job postings
    - `skills_dm` - Skills catalog with skill names and types
- **Bridge Table:** `skills_job_dim` - Resolves the many-to-many relationship between job postings and skills

By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.

## Tech Stack
- **Query Engine:** DuckDB for fast OLAP-style analytical queries
- **Language:** SQL (ANSI-style with analytical functions)
- **Data Model:** Star-schema with fact + dimension + bridge tables
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL scripts

## Analysis Overview

### Query Structure 
1. **[Top Demanded Skills](../Project_1/01_top_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions
2. **[Top Paying Skills](../Project_1/02_highest_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics
3. **[Optimal Skills](../Project_1/03_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills as a data engineer

### Key Insights
- **Core languages:** SQL and Python each appear in ~29,000job postings, making them the most demanded skills
- **Cloud platforms:** AWS and Azure are critical for modern data engineering roles
- **Infra & tooling:** Kubernetes, Docker, and Terraform are associated with premium salaries
- **Big data tools:** Apache Spark shows strong demand with competitive compensation

## SQL Skills Demonstrated

### Query Design & Optimization
- **Complex Joins:** Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`, and `skills_dim`
- **Aggregations:** `COUNT()`, `MEDIAN()`, and `ROUND()` for statistical analysis
- **Filterings:** Boolean logic with `WHERE` clauses and multiple conditions
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques
- **Grouping:** `GROUP BY` for categorical analysis by skill
- **Mathetmatical Functions:** `LN()` for natural logarithm transformations to normalize demand metrics
- **Calculated Metrics:** Derived optimal score combining log-transformed demand with median salary
- **HAVING Clause:** Filtering aggregared results (skills with >= 100 postings)
- **NULL Handling:** Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`)
