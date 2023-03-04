with count_parent as(
    select count(parent) as cnt,c.name as category_name 
    from {{ ref('category') }} c 
    join {{ ref('item') }} i on i.parent=c.id group by c.name),

    max_count_parent as(
       select max(cnt) as max_count from count_parent 
    )
select cnt as count_category,category_name from count_parent, max_count_parent
where cnt=max_count