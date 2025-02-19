select * from movie
select * from moviecoll

--1. Movie does not have collection
select * from movie where id not in (select mid from moviecoll)

--2.highest collection movie
select top 1 mid, sum(coll) from moviecoll group by mid order by 2 desc

--3.Highest Earning Movie on a Specific Date
select top 1 mid,sum(coll) from movie inner join moviecoll on id=mid 
where colldate<='2024-01-01' group by mid  order by 2 desc

--4.Total Collection for Each Movie (Descending Order)
select  mid, sum(coll) from moviecoll group by mid order by 2 desc

--5.Average Collection Per Movie
select mid,avg(coll) from moviecoll group by mid

--6. Monthly Collection Breakdown
select mid,datename(month,colldate),datename(year,colldate),sum(coll) from moviecoll
group by mid,datename(month,colldate),datename(year,colldate) order by mid,datename(month,colldate),datename(year,colldate)

--7. First Movie to Cross a 1 Million Collection
select  mid, sum(coll) from moviecoll group by mid having sum(coll)>1000000

--8.Top 3 Highest Collection Movies Per Year

select mid,p,coll
from(
select mid,year(colldate) p,coll, row_number() over(partition by year(colldate),mid order by coll desc) r from moviecoll)t where t.r=1

SELECT mid, year, total_collection
FROM (
    SELECT mid, 
           YEAR(colldate) AS year, 
           SUM(coll) AS total_collection, 
           ROW_NUMBER() OVER (PARTITION BY YEAR(colldate) ORDER BY SUM(coll) DESC) AS r
    FROM moviecoll
    GROUP BY mid, YEAR(colldate)
) t 
WHERE t.r <= 3  
ORDER BY year, r;


--9. Growth Rate of Movie Collection
-- Calculate the month-over-month growth percentage for a specific movie ID = 5.

--10. Longest Gap Between Movie Release and First Collection
select movie.*,colldate,datediff(day,dor,colldate) from movie inner join moviecoll on id=mid
where datediff(day,dor,colldate)<>0

