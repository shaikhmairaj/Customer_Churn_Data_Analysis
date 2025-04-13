SELECT * FROM telco_churn_data;

SELECT gender FROM telco_churn_data;

SELECT COUNT(*) AS total_customers FROM telco_churn_data;

--2. Churn rate (% of customers who left)

SELECT 
  ROUND(
    (COUNT(*) FILTER (WHERE Churn = 'Yes') * 100.0) / COUNT(*), 
    2
  ) AS churn_rate_percentage
FROM telco_churn_data;

--Churn count by gender
SELECT gender, COUNT(*) FILTER (WHERE Churn = 'Yes') AS churned_customers
FROM telco_churn_data
GROUP BY gender;

--Average monthly charges by contract type

SELECT contract, ROUND(AVG(monthlycharges), 2) AS avg_monthly_charge
FROM telco_churn_data
GROUP BY contract
ORDER BY avg_monthly_charge DESC;

--Churn rate by payment method

SELECT paymentmethod,
       COUNT(*) AS total_customers,
       COUNT(*) FILTER (WHERE churn = 'Yes') AS churned,
       ROUND((COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0) / COUNT(*), 2) AS churn_rate
FROM telco_churn_data
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

--Tenure distribution (how long customers stayed)
SELECT tenure,
       COUNT(*) AS number_of_customers
FROM telco_churn_data
GROUP BY tenure
ORDER BY tenure;

--Top 20 highest-paying customers
SELECT customerid, monthlycharges, totalcharges
FROM telco_churn_data
ORDER BY monthlycharges DESC
LIMIT 20;

--Relationship between InternetService and churn
SELECT internetservice,
       COUNT(*) AS total,
       COUNT(*) FILTER (WHERE churn = 'Yes') AS churned,
       ROUND((COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0) / COUNT(*), 2) AS churn_rate
FROM telco_churn_data
GROUP BY internetservice;





