-- Get all customers and their addresses.
select * from customers
join addresses on customers.id = addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).
select line_items.order_id, line_items.quantity, products.description from line_items
join products on line_items.product_id = products.id;

-- Which warehouses have cheetos?
select warehouse.warehouse from warehouse_product
join warehouse on warehouse_product.warehouse_id = warehouse.id
join products on warehouse_product.product_id = products.id
where description = 'cheetos';

-- Which warehouses have diet pepsi?
select warehouse.warehouse
from warehouse_product
join warehouse on warehouse_product.warehouse_id = warehouse.id
join products on warehouse_product.product_id = products.id
where description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
select customers.first_name, customers.last_name, count(*) from customers
join addresses on addresses.customer_id = customers.id
join orders on orders.address_id = addresses.id
GROUP by customers.id;

-- How many customers do we have?
select COUNT(*) from customers;

-- How many products do we carry?
select COUNT(*) from products;

-- What is the total available on-hand quantity of diet pepsi?
select products.description, SUM(warehouse_product.on_hand) from warehouse_product
join products on products.id = warehouse_product.product_id
where description = 'diet pepsi'
GROUP BY products.description;



-- Stretch
-- How much was the total cost for each order?
-- How much has each customer spent in total?
-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).