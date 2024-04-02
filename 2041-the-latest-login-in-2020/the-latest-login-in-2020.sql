/* Write your PL/SQL query statement below */
SELECT user_id, MAX(time_stamp) last_stamp
FROM Logins
WHERE TO_CHAR(time_stamp, 'YYYY') = '2020'
GROUP BY user_id;