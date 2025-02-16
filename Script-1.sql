SELECT s.State , SUM(Sales) AS Total_Sales
FROM superstore s
GROUP BY s.State  
ORDER BY Total_Sales DESC