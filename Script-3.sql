SELECT AVG(total_sales ) AS avg_ltv
FROM (	
	SELECT
		s."Customer ID",
		sum(s."sales" ) AS total_sales  
	FROM superstore s 
	GROUP BY "Customer ID"
) AS customer_revenues