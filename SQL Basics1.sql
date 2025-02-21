use adf

create table test
(
id int,
[name] varchar(20),
dob date
)

alter table test
add insertdate date

select * from test

alter table test
alter column [name] nvarchar(20)

exec sp_help 'test'

alter table test
alter column id identity(1,1)

alter table test
alter column id int not null

alter table test
add constraint prim_key primary key (id)

select DATENAME(weekday,getdate()-1)


WITH Fibonacci as (
    SELECT 0 AS num1, 1 AS num2, 1 AS seq
    UNION ALL
    SELECT num2, num1 + num2, seq + 1
    FROM Fibonacci
    WHERE seq < 10
)
SELECT  REPLICATE('*',num1)
FROM Fibonacci;


select REPLICATE('*',2)

create function fname
(
@id int,
@name varchar(20)
)
returns int
as 
begin
declare @set int
if exists (select id, name from test where id=@id and name=@name)
set @set=1
else 
set @set=0

return @set
end

select dbo.fname(1,'ketki')


create procedure proc1
(
@id int,
@name varchar(20)
)
as
begin
select dbo.fname(@id,@name)
end

exec proc1 @id=1,@name='ketki'

SELECT REPLICATE('*', num) 
FROM (VALUES (4), (3), (2), (1)) AS T(num);


SELECT CONVERT(VARCHAR, GETDATE(), 102) AS US_Date;
SELECT format(GETDATE(), 'mm-dd-yyyy') AS US_Date;

select CHARINDEX('k','ketki',1)

SELECT id1  
FROM t2  
ORDER BY CASE WHEN id1 = 0 THEN 1 ELSE 2 END,
id1 desc;

select id1,count(id1) from t1  group by id1 having count(id1)>1


select substring('Bank_10234',(charindex('_','Bank_10234',1)+1),(charindex('_','Bank_10234',1)))


select substring('ketki shastri',(charindex(' ','ketki shastri',1)+1),len('ketki shastri'))--shastri
select substring('ketki shastri',1,(charindex(' ','ketki shastri',1)))--ketki

select * from t1 where 1=2

