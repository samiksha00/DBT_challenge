with max_quantity_purchased as 
    (select max(quantity_purchased) as m1 from db1.s1.d_survey)
select u.username as Username from max_quantity_purchased as mqp,
db1.s1.d_survey s
join 
db1.s1.d_user u 
on s.user_id=u.id where s.quantity_purchased = mqp.m1