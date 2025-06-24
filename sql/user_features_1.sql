/*
max order_number
sum days_since_prior_order
avg ays_since_prior_order

Create a SQL query (user_features_1). Based on table orders, for each user, calculate the
max order_number, the sum of days_since_prior_order and the average of
days_since_prior_order.
*/

CREATE OR REPLACE TABLE user_features_1 AS
SELECT 
  user_id,
  MAX(order_number) AS max_order_number,
  SUM(days_since_prior_order) AS total_days_since_prior,
  AVG(days_since_prior_order) AS avg_days_since_prior
FROM orders
GROUP BY user_id;
