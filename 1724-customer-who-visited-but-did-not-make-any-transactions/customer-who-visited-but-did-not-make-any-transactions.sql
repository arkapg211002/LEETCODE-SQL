/* Write your PL/SQL query statement below */

--SELECT COUNT(VISIT_ID), CUSTOMER_ID FROM VISITS GROUP BY CUSTOMER_ID;

--SELECT COUNT(TRANSACTION_ID), VISIT_ID FROM TRANSACTIONS GROUP BY VISIT_ID;

SELECT 
    V.CUSTOMER_ID, 
    SUM(CASE WHEN TRANSACTION_ID IS NULL THEN 1 ELSE 0 END) AS COUNT_NO_TRANS
FROM VISITS V
LEFT JOIN TRANSACTIONS T ON T.VISIT_ID = V.VISIT_ID
WHERE T.TRANSACTION_ID IS NULL
GROUP BY V.CUSTOMER_ID;