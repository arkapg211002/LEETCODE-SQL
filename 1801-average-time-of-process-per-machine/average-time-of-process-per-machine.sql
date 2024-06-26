/* Write your PL/SQL query statement below */
SELECT MACHINE_ID ,
ROUND(SUM(
    CASE WHEN ACTIVITY_TYPE = 'start' THEN -TIMESTAMP ELSE TIMESTAMP END
)/COUNT(DISTINCT PROCESS_ID),3) AS PROCESSING_TIME
FROM ACTIVITY
GROUP BY MACHINE_ID; 