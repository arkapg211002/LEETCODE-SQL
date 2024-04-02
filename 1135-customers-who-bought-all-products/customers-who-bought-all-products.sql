/* Write your PL/SQL query statement below */
select customer_id
from customer join product
on customer.product_key=product.product_key
group by customer_id
having count(distinct(customer.product_key))=(select count(product_key) from product)
