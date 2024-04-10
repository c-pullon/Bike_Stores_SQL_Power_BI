SELECT 
    'sales.customers' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM sales.customers) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'customers' 

UNION ALL

SELECT 
    'sales.order_items' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM sales.order_items) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'order_items' 

UNION ALL

SELECT 
    'sales.orders' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM sales.orders) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'orders'

UNION ALL

SELECT 
    'sales.staffs' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM sales.staffs) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'staffs' 

UNION ALL

SELECT 
    'sales.stores' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM sales.stores) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'stores'; 

SELECT 
    'production.brands' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM production.brands) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'brands' -- Specify the first table name here

UNION ALL

SELECT 
    'production.categories' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM production.categories) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'categories' -- Specify the second table name here

UNION ALL

SELECT 
    'production.products' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM production.products) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'products' -- Specify the third table name here

UNION ALL

SELECT 
    'production.stocks' AS 'Table Name',
    COUNT(c.name) AS 'Number of Columns',
    (SELECT COUNT(*) FROM production.stocks) AS 'Number of Rows',
    STRING_AGG(CONCAT(c.name, ' ', TYPE_NAME(c.user_type_id)), ', ') AS 'Column Data Types'
FROM 
    sys.tables AS t
INNER JOIN 
    sys.columns AS c ON t.object_id = c.object_id
INNER JOIN 
    sys.types AS ty ON c.user_type_id = ty.user_type_id
WHERE
    t.name = 'stocks'; -- Specify the fourth table name here

