/* Write your PL/SQL query statement below */

with overview as (
    select e.id, e.name as employee, e.salary, d.name as department from employee e
    join department d on e.departmentId = d.id
)select department, employee, salary 
    from overview 
    where (department, salary) in (select department, max(salary) 
        from overview 
        group by department);
