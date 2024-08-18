-- 8.Join relevant tables to find the category-wise distribution of pizzas.
select category,count(name) as Count from pizza_types group by category; 