/* Write your PL/SQL query statement below */
SELECT U.UNIQUE_ID, E.NAME
FROM EMPLOYEEUNI U
RIGHT JOIN EMPLOYEES E ON E.ID = U.ID;