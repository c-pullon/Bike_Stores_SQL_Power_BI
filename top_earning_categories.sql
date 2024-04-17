SELECT c.category_name, SUM(oi.quantity * oi.list_price) AS total_revenue
FROM production.categories c
JOIN production.products p ON c.category_id = p.category_id
JOIN production.stocks s ON p.product_id = s.product_id
JOIN sales.order_items oi ON s.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;
