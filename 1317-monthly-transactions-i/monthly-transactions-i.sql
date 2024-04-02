/* Write your PL/SQL query statement below */
select ltrim(TO_CHAR(trans_date,'yyyy-mm'),'0') AS month,
 country,
count(*) as trans_count,
count(distinct case when state = 'approved' then id else null end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from transactions
group by country, ltrim(TO_CHAR(trans_date,'yyyy-mm'),'0');