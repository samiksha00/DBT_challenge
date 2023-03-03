with max_purchased as 
    (select max(quantity_purchased) as m1 from {{ ref('d_survey') }})
select u.username as Usernamefrom max_purchased as mqp,
{{ ref('d_survey') }} s
join 
{{ ref('d_user') }} u 
on s.user_id=u.id where s.quantity_purchased = mqp.m1;