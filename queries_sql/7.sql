-- 7.Determine the distribution of orders by hour of the day.
SELECT HOUR(order_time) AS Hour,COUNT(orders.order_id) AS number_of_orders
FROM orders JOIN
    order_details ON orders.order_id = order_details.order_id
GROUP BY Hour
ORDER BY Hour ASC;