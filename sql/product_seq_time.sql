/*
first write a sql
query to calculate the sequence of product purchase for each user, and name it
product_seq_time 
*/

CREATE OR REPLACE TABLE product_seq_time AS
SELECT 
  user_id,
  order_number,
  product_id,
  ROW_NUMBER() OVER (PARTITION BY user_id, product_id ORDER BY order_number) AS product_seq_time
FROM order_products_prior;


/*也可以用rank


*/