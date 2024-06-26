-- This is a simple subquery to display all products with a higher than avaerage price.
SELECT 
    product_name, 
    list_price
FROM 
    production.products
WHERE 
    list_price > (SELECT AVG(list_price) FROM production.products)
ORDER BY 
    list_price DESC;
