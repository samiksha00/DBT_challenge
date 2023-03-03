with count_parent as(
    select count(parent) as cnt,c.name as category_name 
    from {{ ref('d_category') }} c 
    join {{ ref('d_item') }} i on i.parent=c.id group by c.name),

    max_count_parent as(
       select max(cnt) as max_count from count_parent 
    )
select cnt,category_name from count_parent, max_count_parent
where cnt=max_count;