-- 4.Identify the most common pizza size ordered.
select p.size,sum(quantity) as net_quantity from
order_details as od left join pizzas as p on od.pizza_id=p.pizza_id 
group by p.size order by net_quantity desc limit 1;