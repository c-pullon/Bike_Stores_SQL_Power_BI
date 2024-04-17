SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff_name, 
       SUM(oi.quantity * oi.list_price) AS total_revenue
FROM sales.staffs s
JOIN sales.orders o ON s.staff_id = o.staff_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY CONCAT(s.first_name, ' ', s.last_name)
ORDER BY total_revenue DESC;