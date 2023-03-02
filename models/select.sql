select * from db1.S1.D_USER;

select * from db1.s1.d_category;

select * from db1.s1.d_item;

select * from db1.s1.d_survey;

select * from db1.s1.d_survey where quantity_purchased=(select max(quantity_purchased) from db1.s1.d_survey);

select u.username from db1.s1.d_survey s join db1.s1.d_user u on s.user_id=u.id where s.quantity_purchased=(select max(quantity_purchased) from db1.s1.d_survey);
 
select count(QUANTITY_PURCHASED) from db1.s1.d_survey group by ITEM_PURCHASED;

select sum(QUANTITY_PURCHASED) as QUANTITY_PURCHASED,ITEM_PURCHASED from db1.s1.d_survey group by ITEM_PURCHASED having sum(QUANTITY_PURCHASED)=(
select max(QUANTITY_PURCHASED) from(
select sum(QUANTITY_PURCHASED) as QUANTITY_PURCHASED from db1.s1.d_survey group by ITEM_PURCHASED));
 