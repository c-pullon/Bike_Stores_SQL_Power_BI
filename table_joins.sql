SELECT
	CONCAT(customers.first_name, ' ', customers.last_name) AS customer_name,
	sales.customers.state,
	sales.order_items.quantity,
	sales.order_items.list_price,
	sales.orders.order_date,
	production.products.product_name,
	production.categories.category_name
	
  FROM sales.customers
JOIN sales.orders ON sales.orders.customer_id = sales.customers.customer_id
JOIN sales.order_items ON sales.order_items.order_id = sales.orders.order_id
JOIN production.products ON production.products.product_id = sales.order_items.product_id
JOIN production.categories ON production.categories.category_id = production.products.category_id






