/* Write your PL/SQL query statement below */
with orders_2019 as(select buyer_id,join_date,orders_in_2019 from(select distinct o.buyer_id as buyer_id,to_char(u.join_date)as join_date,count(*) over (partition by o.buyer_id ) as orders_in_2019 from users u full outer join orders o on u.user_id=o.buyer_id where to_char(o.order_date,'YYYY')='2019') order by join_date,buyer_id)
select * from orders_2019 
union 
select user_id as buyer_id, to_char(join_date)as join_date,0 from users where user_id not in(select buyer_id from orders_2019);
 