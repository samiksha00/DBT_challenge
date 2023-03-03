with 
max_QUANTITY_PURCHASED as(
    select max(sum_QUANTITY) as max_purchased from {{ highest() }}
)
select c.id,c.name
from {{ highest() }} s , max_QUANTITY_PURCHASED m
join
{{ ref('d_item') }} i
join
{{ ref('d_category') }} c
on i.parent=c.id
where sum_QUANTITY=max_purchased and s.sum_item=i.id ;