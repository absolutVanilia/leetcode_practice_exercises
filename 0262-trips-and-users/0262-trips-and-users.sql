with temp_table (status, request_at) as
        (select status, request_at from trips t 
        left join users u on t.client_id = u.users_id 
        left join users u2 on t.driver_id = u2.users_id
        where u.banned != 'yes' and u2.banned != 'yes' and request_at between '2013-10-01' and '2013-10-03')

select request_at as Day,
       round(avg(case when status = 'cancelled_by_driver' then 1
                when status = 'cancelled_by_client' then 1
                else 0 end), 2) as 'Cancellation Rate' from temp_table
group by request_at
