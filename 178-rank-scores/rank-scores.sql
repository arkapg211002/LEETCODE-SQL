/* Write your PL/SQL query statement below */
select 
    round(score, 2) "score",
    DENSE_RANK() over (order by score desc) "rank"
from
    Scores
order by score desc
