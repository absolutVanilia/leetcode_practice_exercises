select round(avg(temp.status)*100, 2) as immediate_percentage from
                        (select *, case when order_date = customer_pref_delivery_date then 1 else 0 end as status,
                                rank() over(partition by customer_id order by order_date asc) as ordered_date
                        from delivery) as temp
where ordered_date = 1