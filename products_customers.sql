-- summary stats of products

SELECT 
    MIN(list_price) AS min_price,
    MAX(list_price) AS max_price,
    ROUND(AVG(list_price),2) AS avg_price
FROM 
   production.products;

-- number of unique customers

SELECT COUNT(DISTINCT customer_id) AS unique_customers_count
FROM sales.customers;

