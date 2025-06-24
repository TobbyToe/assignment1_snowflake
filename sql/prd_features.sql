/*
Then on top of this query, for each product, calculate the count, sum of reordered, count of
product_seq_time = 1 and count of product_seq_time = 2.
*/

CREATE OR REPLACE TABLE prd_features AS
SELECT 
  product_id,
  COUNT(*) AS total_purchases,
  SUM(reordered) AS total_reorders,
  SUM(CASE WHEN product_seq_time = 1 THEN 1 ELSE 0 END) AS first_time_purchases,
  SUM(CASE WHEN product_seq_time = 2 THEN 1 ELSE 0 END) AS second_time_purchases
FROM product_seq_time a
JOIN order_products_prior b
ON a.user_id = b.user_id 
AND a.order_number = b.order_number 
AND a.product_id = b.product_id
GROUP BY product_id;
