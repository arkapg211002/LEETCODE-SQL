/* Write your PL/SQL query statement below */

select 
product_id ,year first_year , quantity , price
from (
select 
 p.product_id , p.year  , p.quantity , p.price 
 ,dense_rank() over(partition  by  product_id  order by year  )as okay
 from sales p
) where okay=1
