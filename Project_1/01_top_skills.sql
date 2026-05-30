-- Question: What are the most in-demand skills for data engineers in today's remote job market?

SELECT 
    sd.skills AS skill, 
    COUNT(jfp.*) AS demand_count
FROM 
    skills_dim sd 
INNER JOIN skills_job_dim sjd ON sd.skill_id = sjd.skill_id
INNER JOIN job_postings_fact jpf ON jpf.job_id = sjd.job_id
WHERE 1=1
    AND jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 2 DESC
LIMIT 10;

/*
────────────┬──────────────┐
│   skill    │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  
So - what does that mean? 

SQL and Python seem to be the most in-demand skills for remote data engineers, being required in ~29,000 job postings. 
AWS and Azure (both cloud platforms) come in third and fourth, at ~18,000 and ~14,000 respectively. 
Apache Spark completes the top 5 most in-demand skills appearing in ~13,000 postings, highlighting the importance of big data processing. 

Key Takeaways:
- SQL and Python are foundational skills for data engineers
- Cloud platforms (AWS, Azure) are critical for modern data engineering
- Big data tools (Apache Spark) are highly valued
- Data pipeline tools (Airflow, Snowflake, Databricks) are growing in demand
- Java and GCP remain valuable skills, though not critial to have in today's remote data engineering job market

*/
