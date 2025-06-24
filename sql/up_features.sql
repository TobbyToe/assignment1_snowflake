/*
Create a SQL query (up_features). Based on table order_products_prior, for each user and
product, calculate the total number of orders, minimum order_number, maximum
order_number and average add_to_cart_order
*/

CREATE OR REPLACE TABLE up_features AS
SELECT 
  user_id,
  product_id,
  COUNT(DISTINCT order_id) AS total_orders,
  MIN(order_number) AS first_order_number,
  MAX(order_number) AS last_order_number,
  AVG(add_to_cart_order) AS avg_add_to_cart_order
FROM order_products_prior
GROUP BY user_id, product_id;
