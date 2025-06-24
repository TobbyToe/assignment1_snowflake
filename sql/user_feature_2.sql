/* 基于 order_products_prior 表，算每个用户：
总产品数
不同产品数
复购率（reordered=1 数量 / order_number>1 数量）

Create a SQL query (user_features_2). Similar to above, based on table
order_products_prior, for each user calculate the total number of products, total number of
distinct products, and user reorder ratio(number of reordered = 1 divided by number of
zidan .guo186@gmail .com
order_number > 1)

*/

CREATE OR REPLACE TABLE user_features_2 AS
SELECT 
  user_id,
  COUNT(product_id) AS total_products,
  COUNT(DISTINCT product_id) AS distinct_products,
  SUM(CASE WHEN reordered = 1 THEN 1 ELSE 0 END) 
    / NULLIF(COUNT(DISTINCT CASE WHEN order_number > 1 THEN order_id END),0) AS user_reorder_ratio
FROM order_products_prior
GROUP BY user_id;
