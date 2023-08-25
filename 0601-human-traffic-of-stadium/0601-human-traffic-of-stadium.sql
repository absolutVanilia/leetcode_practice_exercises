select id, visit_date, people from 
(select *, lag(people) over() as dbf,
          lag(people, 2) over() as twodbf, 
          lead(people) over() as daf,
          lead(people, 2) over() as twodaf from stadium) as temp
where (dbf >= 100 and twodbf >= 100 and people >= 100)
      or (dbf >= 100 and daf >= 100 and people >= 100)
      or (daf >= 100 and twodaf >= 100 and people >= 100)
