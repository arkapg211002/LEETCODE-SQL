/* Write your PL/SQL query statement below */
SELECT 
    ID,
    TO_CHAR(VISIT_DATE) AS VISIT_DATE,
    PEOPLE AS PEOPLE 
FROM 
    (
        SELECT 
            ID,
            VISIT_DATE,
            PEOPLE AS PEOPLE_K,
            LAG(PEOPLE) OVER(ORDER BY ID) AS PREV1,
            LAG(PEOPLE, 2) OVER(ORDER BY ID) AS PREV2,
            PEOPLE,
            LEAD(PEOPLE) OVER(ORDER BY ID) AS NEXT1,
            LEAD(PEOPLE, 2) OVER(ORDER BY ID) AS NEXT2 
        FROM 
            STADIUM
    ) S 
WHERE 
    (PEOPLE_K >= 100 AND 
    (
        (PREV1 >= 100 AND NEXT1 >= 100) OR 
        (PREV1 >= 100 AND PREV2 >= 100) OR 
        (NEXT1 >= 100 AND NEXT2 >= 100)
    )
);
