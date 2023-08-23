select count(*) as rich_count from (select * from store
where amount > 500
group by customer_id) as t