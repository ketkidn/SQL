select * from destinations
select * from travelers
select * from bookings
select * from reviews



--1.Find all travelers who have booked a trip but have not given a review yet.
select t.travelerid,name from travelers t
left join bookings r  on t.travelerid=r.travelerid
left join reviews b on t.travelerid=b.travelerid
where b.travelerid is null

--2.Retrieve the top 3 most popular travel destinations based on the number of bookings.
select top 3 b.destinationid,name,country,count(b.destinationid) from destinations d
inner join bookings b on d.destinationid=b.destinationid
group by b.destinationid,name,country
order by 4 desc

--3.Find the total revenue generated from bookings for each destination.
select b.destinationid,sum(price) from destinations d
inner join bookings b on d.destinationid=b.destinationid
group by b.destinationid 
having sum(price)>1

--4.List all travelers along with their preferred destination names (if available), even if they have not made any bookings.
SELECT t.TravelerID, t.Name, t.Age, t.Email, 
       t.PreferredDestinationID, d.Name AS PreferredDestinationName
FROM Travelers t
LEFT JOIN Destinations d ON t.PreferredDestinationID = d.DestinationID;

--5.Identify travelers who have booked a destination more than once.
select b.travelerid,b.destinationid,count(b.destinationid) from travelers t
inner join bookings b on b.travelerid=t.travelerid
group by b.travelerid,b.destinationid having count(b.destinationid) >1

--6.Retrieve the average age of travelers who have booked trips to each destination.
select b.destinationid,avg(Age) from Travelers t 
inner join bookings b on b.travelerid=t.travelerid
where t.age is not null
group by  b.destinationid

--7.Find all destinations that have received at least one review with a rating of 5.
select r.destinationid,d.name,d.country,r.rating from destinations d 
inner join reviews r on d.destinationid=r.destinationid
where r.rating=5


--8.List travelers who have booked a trip but whose email addresses are missing.
select t.* from travelers t
inner join bookings b on b.travelerid=t.travelerid
where t.email is null

--9.Find destinations where more than one traveler has given the same rating.
select r.destinationid,r.rating,count(r.travelerid) from destinations d 
inner join reviews r on d.destinationid=r.destinationid
group by r.destinationid,r.rating
having count(r.travelerid)>1

--10.Retrieve the traveler who has spent the highest total amount on bookings.
select top 1  b.travelerid,sum(price) from travelers t
inner join bookings b on b.travelerid=t.travelerid
where price is not null
group by b.travelerid
order by sum(price) desc