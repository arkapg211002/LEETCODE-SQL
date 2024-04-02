/* Write your PL/SQL query statement below */
select rownum as id,student 
 from  (select (case when mod(id,2) = 0 then id-1 else id+1 end) as id ,student
        from seat 
        order by id);