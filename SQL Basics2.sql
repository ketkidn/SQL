select id1,row_number() over (partition by id1 order by id1 desc) as r from t1
select id1,dense_rank() over ( order by id1 ) as r from t1
select id1,rank() over ( order by id1 ) as r from t1

select * from t1 inner join t2 on t1.id1=t2.id1 --5
select * from t1 left join t2 on t1.id1=t2.id1 --10
select * from t1 right join t2 on t1.id1=t2.id1--6
select * from t1 full join t2 on t1.id1=t2.id1--11
select * from t1 cross join t2 --32

1         1
1		  1
0		  0
null	  null
null
2
2
2

select * from t1 union select * from t2 --4
select * from t1 union all select * from t2 --12
select * from t1 intersect select * from t2 --3
select * from t1 except select * from t2--1