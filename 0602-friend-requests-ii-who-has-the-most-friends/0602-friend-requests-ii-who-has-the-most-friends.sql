select t.requester_id as id, sum(t.num) as num from (select requester_id, count(*) as num from RequestAccepted 
group by requester_id
union all
select accepter_id, count(*) as num from RequestAccepted 
group by accepter_id) as t
group by t.requester_id
order by num desc
limit 1