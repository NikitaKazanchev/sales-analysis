SELECT "Product Name", SUM(s.Profit) AS Total_Profit
FROM superstore s 
GROUP BY "Product Name" 
ORDER BY Total_Profit DESC 
LIMIT 10