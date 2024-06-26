-- This creates a CTE to find the find the total revenue for each numbered week in a year.
-- Then a window function is used to display the running total revenue
WITH WeeklyRevenue AS (
    SELECT 
        DATEPART(YEAR, o.order_date) AS order_year,
        DATEPART(WEEK, o.order_date) AS order_week,
        SUM(oi.quantity * oi.list_price) AS weekly_revenue
    FROM 
        sales.orders o
    JOIN 
        sales.order_items oi ON o.order_id = oi.order_id
    GROUP BY 
        DATEPART(YEAR, o.order_date), DATEPART(WEEK, o.order_date)
)
SELECT 
    order_year,
    order_week,
    weekly_revenue,
    SUM(weekly_revenue) OVER (ORDER BY order_year, order_week) AS overall_running_total_revenue,
    SUM(weekly_revenue) OVER (PARTITION BY order_year ORDER BY order_week) AS yearly_running_total_revenue
FROM 
    WeeklyRevenue
ORDER BY 
    order_year, order_week;



