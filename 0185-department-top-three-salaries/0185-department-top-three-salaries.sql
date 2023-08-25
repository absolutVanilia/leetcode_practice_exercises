select temp.department, temp.employee, salary from 
(select e.name as employee, d.name as department, salary, dense_rank() over(partition by departmentID order by salary desc) as rk from employee e
left join department d on e.departmentId = d.id) as temp
where rk <=3