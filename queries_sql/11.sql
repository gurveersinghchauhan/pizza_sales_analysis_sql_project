-- 11.Calculate the percentage contribution of each pizza type to total revenue.--

with total_revenue as 
( select round(sum(order_details.quantity*pizzas.price),0) as total
from pizzas join pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id 
join order_details on order_details.pizza_id=pizzas.pizza_id),

revenuepizzatype 
as(select pizza_types.name,
round(sum(order_details.quantity * pizzas.price),1)  as revenue from pizzas join 
pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id 
join order_details on order_details.pizza_id=pizzas.pizza_id 
group by pizza_types.name
)

select revenuepizzatype.name,
round((revenuepizzatype.revenue/total_revenue.total)*100,1)
as percentage_contribution from revenuepizzatype join total_revenue;