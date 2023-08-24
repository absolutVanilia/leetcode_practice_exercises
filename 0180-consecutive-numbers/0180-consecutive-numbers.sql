select num as ConsecutiveNums  from (select *, lag(lg1) over() as lg2 
                from (select *, lag(num) over() as lg1 
                      from logs) as temp) as temp2
where num = lg1 and num = lg2
group by ConsecutiveNums