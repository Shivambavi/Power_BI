
select*from pizza_sales;

/*TO SHOW THE TOTAL REVENUE*/
select sum(total_price) as Total_Revenue from pizza_sales;

/*TO SHOW THE AVG ORDER VALUE*/
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales;

/*TO SHOW TOTAL PIZZA SOLD*/
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

/*TO SHOW TOTAL ORDERS*/
select count(distinct order_id) as Total_Orders from pizza_sales;

/*TO SHOW AVG PIZZA PER ORDER*/
select cast(cast(sum(quantity) as decimal (10,2)) / 
cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as Avg_Pizza_Per_Order from pizza_sales;

/*TO SHOW DAILY TRENDS OF ORDER*/
select datename(DW, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by datename(dw,order_date);

/*TO SHOW TOTAL PIZZA ORDERS BY MONTH*/
select datename(month, order_date) as month_name, count(distinct order_id) as total_orders from pizza_sales
group by datename(month, order_date)
order by total_orders desc;

/*TO SHOW PIZZA SIZE TOTAL SALE FY PCT by qtr*/
select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_sales, cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT DESC;

select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_sales, cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date)=2
group by pizza_size

order by PCT DESC;

select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_sales, cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date)=3
group by pizza_size
order by PCT DESC;

select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_sales, cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date)=4
group by pizza_size
order by PCT DESC;

/*TOTAL SALE BY PIZZA NAME by des*/
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc


/*TOTAL SALE BY PIZZA NAME by asc*/
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc

/*Top 5 Pizza sold by quantity desc*/
select top 5 pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc

/*Top 5 Pizza sold by quantity asc*/
select top 5 pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity asc

/*TOP 5 PIZZA NAME BY TOTAL ORDERS*/
select top 5 pizza_name, count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders 


use [Pizza DB];








