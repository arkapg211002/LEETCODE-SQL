/* Write your PL/SQL query statement below */

SELECT * FROM 
(
SELECT ID, COUNT(ID) AS NUM
FROM 
(
SELECT requester_id as ID, accept_date, 'requester' AS FLAG FROM Requestaccepted 
UNION ALL
SELECT accepter_id as ID, accept_date, 'accepter' AS FLAG FROM Requestaccepted
)
GROUP BY ID
ORDER BY NUM DESC
)
WHERE 
ROWNUM = 1;
