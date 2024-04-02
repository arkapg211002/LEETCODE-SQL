/* Write your PL/SQL query statement below */
WITH week_table AS (   
    SELECT 
        DISTINCT a.visited_on AS start_date,
        b.visited_on AS end_date
    FROM customer a
    JOIN customer b ON b.visited_on - a.visited_on = 6;
)

SELECT 
    to_char(w.start_date + 6, 'YYYY-MM-DD') AS visited_on,
    SUM(c.amount) AS amount,
    ROUND(SUM(c.amount)/7 ,2) AS average_amount
FROM week_table w, customer c
WHERE c.visited_on BETWEEN w.start_date AND w.end_date
GROUP BY w.start_date
ORDER BY visited_on;
