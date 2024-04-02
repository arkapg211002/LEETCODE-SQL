CREATE FUNCTION getNthHighestSalary(N IN NUMBER) 
RETURN NUMBER IS
    result NUMBER;
BEGIN

    select 
        a.Salary
    into 
        result
    from 
        ( 
            SELECT 
                distinct 
                Salary,
                dense_rank() over ( order by salary desc) as rn        
            FROM  
                Employee
        ) a
    where 
        a.rn = N;

    RETURN result;

END;