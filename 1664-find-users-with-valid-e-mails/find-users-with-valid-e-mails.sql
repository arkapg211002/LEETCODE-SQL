/* Write your PL/SQL query statement below */
SELECT * FROM USERS
WHERE REGEXP_LIKE(MAIL,'^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$');
                        