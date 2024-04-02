/* Write your PL/SQL query statement below */
 select category, nvl(count(income),0) as accounts_count 
 from
 (
    select a.category, b.income
    from
        (select 'Low Salary' as category from dual union all
        select 'Average Salary' as category from dual union all 
        select 'High Salary' as category from dual) a
    left join
        (select account_id, income, 
        case 
        when income < 20000 then 'Low Salary'
        when income > 50000 then 'High Salary'
        else 'Average Salary'
        end as salary_slab
        from accounts) b
    on a.category = b.salary_slab
 )
 group by category;