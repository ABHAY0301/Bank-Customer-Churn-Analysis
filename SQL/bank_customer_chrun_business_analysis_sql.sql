-- Basic Business Understanding

--Q1. How many customers are there?
--
SELECT 
	COUNT(*) AS total_customer
FROM bank_churn


--Q2. How many customers churned?
--
SELECT 
	COUNT(*) AS churned_customer
FROM bank_churn
WHERE exited = 1


--Q3. What is overall churn rate?
--
SELECT
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn


--Q4. How many customers are retained vs churned?
--
SELECT 
	churn_status,
	COUNT(*) AS no_of_customer
FROM bank_churn
GROUP BY churn_status


----------------------------------------------------------------------------------------------------------------------

-- Customer Demographics Analysis

--Q5. Which geography has highest churn?
--
SELECT
	geography,
	COUNT(*) AS  highest_churn
FROM bank_churn
WHERE churn_status = 'Churned'
GROUP BY geography
ORDER BY highest_churn  DESC

-- OR

SELECT
	Geography,
	COUNT(*) customers,
	ROUND(AVG(Exited)*100,2) AS churn_rate
FROM bank_churn
GROUP BY Geography
ORDER BY churn_rate DESC;


--Q6. Does gender affect churn?
--
SELECT
	gender,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY gender


--Q7. Which age group churns most?
--
SELECT
	age_group,
	COUNT(*) customers,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY age_group
ORDER BY churn_rate DESC


----------------------------------------------------------------------------------------------------------------------

--Customer Behavior Analysis

--Q8. Do active customers churn less?
--
SELECT
	is_active_member,
	COUNT(*) AS customer,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY is_active_member


--Q9. Does credit card ownership affect churn?
--
SELECT
	has_cr_card,
	COUNT(*) AS customer,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY has_cr_card


--Q10. Does number of products affect churn?
--
SELECT
	num_of_products,
	COUNT(*) AS customer,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY num_of_products
ORDER BY num_of_products


--Q11. Does customer tenure affect churn?
--
SELECT
	tenure,
	COUNT(*) AS customer,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY tenure
ORDER BY tenure


----------------------------------------------------------------------------------------------------------------------

--Financial Analysis

--Q12. Average balance by churn status?
--
SELECT
	churn_status,
	ROUND(AVG(balance)::NUMERIC,2) AS avg_balance
FROM bank_churn
GROUP BY churn_status


--Q13. Average salary by churn status?
--
SELECT
	churn_status,
	ROUND(AVG(estimated_salary)::NUMERIC,2) AS avg_balance
FROM bank_churn
GROUP BY churn_status


--Q14. Are high balance customers leaving?
--
SELECT 
	CASE WHEN balance <50000 THEN 'Low'
		 WHEN balance<100000 THEN 'Medium'
		 ELSE 'High'
	END balance_group,
	COUNT(*) AS customer,
	ROUND(AVG(exited),2) * 100 AS churn_rate
FROM bank_churn
GROUP BY balance_group

----------------------------------------------------------------------------------------------------------------------

-- Intermediate Business Questions

--Q15. Top 5 highest balance churned customers?
--
SELECT 
	customer_id,
	balance
FROM bank_churn
WHERE exited = 1
ORDER BY balance DESC
LIMIT 5


--Q16. Geography + Gender combined analysis.
--
SELECT
	geography,
	gender,
	ROUND(AVG(exited)*100,2) churn_rate
FROM bank_churn
GROUP BY geography,gender
ORDER BY churn_rate DESC;


--Q17. Age group + activity analysis.
--
SELECT
	age_group,
	is_active_member,
	ROUND(AVG(exited)*100,2) churn_rate
FROM bank_churn
GROUP BY age_group,is_active_member
ORDER BY churn_rate DESC;





































