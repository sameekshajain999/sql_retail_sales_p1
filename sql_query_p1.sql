--SQL Retail sales Analysis - p1
create database sql_project_p1;


-- create table
create table  retail_sales (
  transaction_id int primary key ,
  sale_date DATE,
  sale_time TIME,
  customer_id int,
  gender varchar(10),
  age int,
  category varchar (15),
  quantiy int,
  price_per_unit int,
  cogs float,
  total_sale int
);
select * from retail_sales;
select count (* ) from retail_sales;

-- data exploriation
-- how many sales we have
select count(*) as total_sales 
 from retail_sales;
 --how many unique  customer we have 
 select count ( distinct customer_id) as total_sales from retail_sales;
 -- how many category
 select  category as total_sales from retail_sales;
 -- data analysis and bussiness key problem and answer
 -- Q1 . write a sql query to retrive all columns for sales made on 2022-11-05
 select * from retail_sales
 where sale_date='2022-11-05'; 
 -- Q2 . write a query to retrive all transaction where the category is 'clothing' and the quantity sold is more than 10 in the month of NOV 2022
 select 
 * 
  from retail_sales
 where
 category='clothing'
 AND
 to_char(sale_dATE,'YYYY-MM')='2022-11'
 AND
 quantiy>=4;
 --Q3.write a sql query to calculate the total (total_sale) for each category
 select 
 category, 
 sum(total_sale),
 count (*) as total_orders
 from retail_sales
 group by 1
 --Q4 write a sql query to find the average age of customer who purchased items from 'beauty'categroy
 select 
 
avg(age) as avg_age
 from retail_sales
 where category='beauty'
 --Q5. write a sql query to find all transaction where the total_sale is greater than 1000;
 select * from retail_sales
 where total_sale>=1000;
 --Q6.write a query to find the total number of transaction (transaction_id)made by each gender in each category
 select 
category,
gender,
count(*) as total_transaction
from retail_sales
group by
category,
gender
order by 1
--Q7. write query to calculate sale for each month.find out best selling month in each year

select
extract (year from sale_date) as  year,
extract(month from sale_date) as month,
avg(total_sale)
from retail_sales
group by 1,2
order by 1,2 desc;
--Q8. write a SQL query to find the top 5 customer on the highest total sales
select 
customer_id,
sum(total_sale)as total_sales
from retail_sales
group by 1
order by 2 desc
--Q9 write sql query to find the number of unique customers who purchased item from each category
select 
category,
customer_id
from retail_sales;
--end of project