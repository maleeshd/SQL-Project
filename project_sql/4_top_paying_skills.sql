/*
Answer : What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions
-Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Analysts and
help identify the most financially rewarding skills to acquire or improve

*/



SELECT 
skills,
ROUND (AVG(salary_year_avg),0) AS avg_salary


FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 

WHERE
     job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
      AND job_work_from_home = TRUE

GROUP BY 
skills

ORDER BY 
avg_salary DESC
LIMIT 25 


/*

Quick insights

1. Big Data & data engineering skills dominate the top

PySpark is the clear #1 at $208K, substantially higher than the other skills.
Databricks ($142K), Airflow ($126K), Kubernetes ($133K) and Elasticsearch ($145K) also point toward large-scale data infrastructure.
This suggests that analysts who can work with large datasets and data pipelines tend to be associated with higher-paying roles.

2. Python's data ecosystem is strongly represented

Pandas – $152K
Jupyter – $153K
NumPy – $144K
Scikit-learn – $126K
Together, these indicate strong demand for Python-based analytics, data science and machine learning capabilities.

3. DevOps / software engineering skills appear frequently
Several skills are not traditional "data analyst" tools:

Bitbucket – $189K
GitLab – $155K
Linux – $137K
Kubernetes – $133K
Jenkins – $125K
Golang – $145K

This suggests that the highest-paying analyst roles increasingly overlap with engineering and technical infrastructure rather than being limited to reporting and dashboards.

4. Cloud and modern data platforms are valuable

Databricks – $142K
GCP – $123K
Couchbase – $161K
Elasticsearch – $145K

A recurring theme is the ability to work with cloud platforms, distributed systems and modern data infrastructure.

5. AI/ML skills also appear among the highest paid

DataRobot – $155K
Watson – $161K
Scikit-learn – $126K

This points toward a premium for analysts who can move beyond descriptive analytics into machine learning and AI-driven analysis.

💰 Salary pattern

The average salary across these 25 skills is approximately $142K.

The top 5 are particularly notable:

Skill	Avg. Salary
PySpark	$208K
Bitbucket	$189K
Couchbase	$161K
Watson	$161K
DataRobot	$155K

PySpark stands out significantly — its average salary is roughly $53K higher than the average across the top 25 skills.




*/