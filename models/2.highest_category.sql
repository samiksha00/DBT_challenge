with 
sum_QUANTITY_PURCHASED as(
    select sum(QUANTITY_PURCHASED) as sum_QUANTITY, ITEM_PURCHASED as sum_item from {{ ref('d_survey') }} group by ITEM_PURCHASED),

max_QUANTITY_PURCHASED as(
    select max(sum_QUANTITY) as max_purchased from sum_QUANTITY_PURCHASED
)
select c.id,c.name
from sum_QUANTITY_PURCHASED s , max_QUANTITY_PURCHASED m
join
{{ ref('d_item') }} i
join
{{ ref('d_category') }} c
on i.parent=c.id
where sum_QUANTITY=max_purchased and s.sum_item=i.id ;