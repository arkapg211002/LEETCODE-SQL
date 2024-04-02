/* Write your PL/SQL query statement below */
SELECT person_name 
FROM (
        SELECT q1.person_name as person_name
        FROM Queue q1 INNER JOIN Queue q2 ON (q1.turn >= q2.turn)
        group by q1.turn,q1.person_name
        having sum(q2.weight) <=1000
        order by sum(q2.weight) desc
      ) 
WHERE Rownum = 1;
