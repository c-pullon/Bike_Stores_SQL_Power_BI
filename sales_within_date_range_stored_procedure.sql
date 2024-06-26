-- This stored procedure returns the dates and total sales revenue for each day within a specified range
CREATE PROCEDURE GetSalesByDateRange @StartDate DATE, @EndDate DATE
AS
BEGIN
    SELECT 
        o.order_date,
        SUM(oi.quantity * oi.list_price) AS total_sales
    FROM 
        sales.orders o
    JOIN 
        sales.order_items oi ON o.order_id = oi.order_id
    WHERE 
        o.order_date BETWEEN @StartDate AND @EndDate
    GROUP BY 
        o.order_date
    ORDER BY 
        o.order_date;
END;

-- Executing a stored procedure 
EXEC GetSalesByDateRange @StartDate = '2017-01-01', @EndDate = '2017-12-31';
