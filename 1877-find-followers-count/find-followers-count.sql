/* Write your PL/SQL query statement below */
SELECT USER_ID, COUNT(FOLLOWER_ID) AS FOLLOWERS_COUNT
FROM FOLLOWERS GROUP BY USER_ID
ORDER BY USER_ID;