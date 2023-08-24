select p.product_id, (case when temp.product_id is not null then new_price else 10 end) as price from products p
left join (select product_id, max(change_date) as max from products 
where change_date <= '2019-08-16'
group by product_id) as temp on p.product_id = temp.product_id
where p.change_date = temp.max or max is null
group by p.product_id
