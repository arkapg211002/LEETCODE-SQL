/* Write your PL/SQL query statement below */
/* Write your PL/SQL query statement below */
SELECT DISTINCT teacher_id, COUNT(DISTINCT subject_id) cnt FROM 
Teacher GROUP BY teacher_id;