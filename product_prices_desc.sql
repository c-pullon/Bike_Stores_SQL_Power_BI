-- Show the top 10 most expensive products ordered by descending price
SELECT TOP 10
	product_name, 
	list_price
FROM production.products
ORDER BY list_price DESC
