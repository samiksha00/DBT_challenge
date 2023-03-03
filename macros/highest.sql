{% macro highest() %}

    (select sum(QUANTITY_PURCHASED) as sum_QUANTITY, ITEM_PURCHASED as sum_item from db1.s1.d_survey group by ITEM_PURCHASED)

{% endmacro %}