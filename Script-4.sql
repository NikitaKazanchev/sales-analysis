SELECT city, AVG(JULIANDAY(ship_date_formatted) - JULIANDAY(order_date_formatted)) AS delivery_time
FROM
	(SELECT  
		city,
		SUBSTR("Order Date", -4) || '-' ||  -- Год
    	printf('%02d', SUBSTR("Order Date", 1, INSTR("Order Date", '/') - 1)) || '-' ||  -- Месяц
    	printf('%02d', SUBSTR(SUBSTR("Order Date", INSTR("Order Date", '/') + 1), 1, INSTR(SUBSTR("Order Date", INSTR("Order Date", '/') + 1), '/') - 1)) AS order_date_formatted,
    	SUBSTR("Ship Date", -4) || '-' ||  -- Год
    	printf('%02d', SUBSTR("Ship Date", 1, INSTR("Ship Date", '/') - 1)) || '-' ||  -- Месяц
    	printf('%02d', SUBSTR(SUBSTR("Ship Date", INSTR("Ship Date", '/') + 1), 1, INSTR(SUBSTR("Ship Date", INSTR("Ship Date", '/') + 1), '/') - 1)) AS ship_date_formatted
	FROM superstore)
GROUP BY city
ORDER By delivery_time DESC
LIMIT 10