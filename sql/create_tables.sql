CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  eval_set STRING,
  order_number INT,
  order_dow INT,
  order_hour_of_day INT,
  days_since_prior_order INT
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name STRING,
  aisle_id INT,
  department_id INT
);

CREATE TABLE aisles (
  aisle_id INT PRIMARY KEY,
  aisle STRING
);

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department STRING
);

CREATE TABLE order_products (
  order_id INT,
  product_id INT,
  add_to_cart_order INT,
  reordered INT
);
/* 
create order_products_prior
*/
CREATE TABLE order_products_prior AS
SELECT 
  a.*,
  b.product_id,
  b.add_to_cart_order,
  b.reordered
FROM orders a
JOIN order_products b 
ON a.order_id = b.order_id
WHERE a.eval_set = 'prior';