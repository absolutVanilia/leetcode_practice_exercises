select temp.Department, temp.Employee, temp.Salary from
      (select d.name as Department, e.name as Employee, Salary, rank() over(partition by d.name order by salary desc) as rk
      from employee e 
      left join department d on e.departmentId = d.id) as temp
where temp.rk = 1
