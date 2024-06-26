/* Write your PL/SQL query statement below */
SELECT DISTINCT 
        S.USER_ID, 
        ROUND(COUNT(CASE WHEN C.ACTION = 'confirmed' THEN 1 END)/COUNT(*),2 )AS        CONFIRMATION_RATE
FROM CONFIRMATIONS C
RIGHT JOIN SIGNUPS S ON S.USER_ID = C.USER_ID
GROUP BY C.USER_ID, S.USER_ID;
