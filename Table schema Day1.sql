create table t2
(
 id1 int
)

insert into t1 values(2)
insert into t1 values(2)
insert into t1 values(2)
insert into t2 values(NULL)

select * from t1
select * from t2
select * from t1  cross apply t2 on t1.id1=t2.id1

create table movie
(
id int identity (1,1) primary key,
name varchar(20),
DOR date
)


create table moviecoll
(
cid int  identity (1,1) primary key,
mid int,
coll int,
colldate date
CONSTRAINT fk foreign key (cid) references movie(id)
)

DECLARE @str NVARCHAR(100) = 'mandar'

;WITH cte AS (
    SELECT LEFT(@str, 1) AS letter, RIGHT(@str, LEN(@str) - 1) AS remaining
    FROM (SELECT @str AS str) AS t
    UNION ALL
    SELECT LEFT(remaining, 1), RIGHT(remaining, LEN(remaining) - 1)
    FROM cte
    WHERE LEN(remaining) > 0
)
SELECT letter FROM cte
insert into movie values('A','2007-11-02');
insert into movie values('B','2007-06-20');
insert into movie values('C','2009-07-04');
insert into movie values('D','2011-12-13');
insert into movie values('E','2015-12-20');

insert into moviecoll values(1,500000,'2007-11-02')
insert into moviecoll values(1,12000,'2008-01-02')
insert into moviecoll values(1,40000,'2007-12-10')

insert into moviecoll values(2,700000,'2007-06-20')
insert into moviecoll values(2,600000,'2007-09-03')
insert into moviecoll values(2,50000,'2007-11-10')

insert into moviecoll values(4,900000,'2011-12-13')
insert into moviecoll values(4,600000,'2012-05-14')
insert into moviecoll values(4,50000,'2012-08-23')
insert into moviecoll values(4,5000,'2013-01-09')

insert into moviecoll values(5,1000000,'2015-12-20')
insert into moviecoll values(5,500000,'2015-12-27')

alter table moviecoll
add constraint fk foreign key (mid) references movie(id)