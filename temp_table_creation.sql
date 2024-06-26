-- Create the temporary table with all the data to be used in Power BI
CREATE TABLE #BikeSalesDashboard (
    order_id INT,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_state VARCHAR(50),
    order_date DATE,
    shipped_date DATE,
    required_date DATE,
    quantity INT,
    revenue DECIMAL(18, 2),
    product VARCHAR(100),
    brand VARCHAR(100),
    list_price DECIMAL(18, 2),
    category VARCHAR(100),
    store_name VARCHAR(100),
    store_city VARCHAR(100),
    store_state VARCHAR(50),
    employee_name VARCHAR(100)
);

-- Populate the temporary table with the data needed for Power BI
INSERT INTO #BikeSalesDashboard
SELECT
    ord.order_id,
    cus.first_name + ' ' + cus.last_name,
    cus.city,
    cus.state,
    ord.order_date,
    ord.shipped_date,
    ord.required_date,
    SUM(ite.quantity),
    SUM(ite.quantity * ite.list_price * (1 - ite.discount)),
    prod.product_name,
    bra.brand_name,
    prod.list_price,
    cat.category_name,
    sto.store_name,
    sto.city,
    sto.state,
    sta.first_name + ' ' + sta.last_name
FROM sales.orders ord
JOIN sales.customers cus ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite ON ord.order_id = ite.order_id
JOIN production.products prod ON ite.product_id = prod.product_id
JOIN production.categories cat ON prod.category_id = cat.category_id
JOIN sales.stores sto ON ord.store_id = sto.store_id
JOIN sales.staffs sta ON ord.staff_id = sta.staff_id
JOIN production.brands bra ON prod.brand_id = bra.brand_id
GROUP BY
    ord.order_id,
    cus.first_name, cus.last_name,
    cus.city, cus.state,
    ord.order_date, ord.shipped_date, ord.required_date,
    prod.product_name, bra.brand_name, prod.list_price,
    cat.category_name, sto.store_name, sto.city, sto.state,
    sta.first_name, sta.last_name;



-- Show the top 5 brands by total revenue
SELECT TOP 5
    brand,
    SUM(revenue) AS total_revenue
FROM 
    #BikeSalesDashboard
GROUP BY 
    brand
ORDER BY 
    total_revenue DESC



-- Find total revenue by customer city and product category
SELECT 
    customer_city,
    category,
    SUM(revenue) AS total_revenue
FROM 
    #BikeSalesDashboard
GROUP BY 
    customer_city, 
    category
ORDER BY 
    total_revenue DESC;

DROP TABLE #BikeSalesDashboard;
