Use CaseStudyOne


-- count of 3 types
select rideable_bike, COUNT(*) as BicycleTypeCount
From RideNoNull
Group by rideable_bike


-- count of start_station
select start_station_name, count(*) as StartStationCount
From RideNoNull
Group by start_station_name
Order by StartStationCount Desc


-- count of end_station
select end_station_name, count(*) as EndStationCount
From RideNoNull
Group by end_station_name
Order by EndStationCount Desc

-- count of member_casual on weekday
select ride_weekday, member_casual, count(*) as Count
From RideNoNull
Group by ride_weekday, member_casual
Order by ride_weekday Desc , member_casual Desc

-- count of member_casual in hours



Select  Datepart(hour, started_at) as hour, member_casual, count(*)
From RideNoNull
Group by Datepart(hour, started_at), member_casual
Order by Datepart(hour, started_at), member_casual Desc


-- length of member_casual in hours

select DATEPART(hour, started_at) as hour, member_casual, avg(ride_length)
From RideNoNull
Group by DATEPART(hour, started_at), member_casual
Order by DATEPART(hour, Started_at), member_casual Desc

-- Count of member_casual in season

Select  ride_season, member_casual, count(*) as Count
From RideNoNull
Group by ride_season, member_casual
Order by ride_season, member_casual Desc

-- length of member_casual in season

Select  ride_season, member_casual, Avg(ride_length)
From RideNoNull
Group by ride_season, member_casual
Order by ride_season, member_casual Desc


-- AvgRideLength
select  AVG(ride_length)
From RideNoNull

Select member_casual, ride_weekday, AVG(ride_length)
From RideNoNull
Group by member_casual, ride_weekday
Order by ride_weekday, member_casual Desc


-- station
Select Top(10) member_casual, start_station_name, Count(*) 
From RideNoNull
Group by member_casual, start_station_name
Order by member_casual, Count(*) Desc

Select Top(10) member_casual, start_station_name, Count(*) 
From RideNoNull
Group by member_casual, start_station_name
Order by member_casual Desc, Count(*) Desc


Select Top(100) *
From RideNoNull



-- formal


-- number of member_casual
Select member_casual,  count(*) as Number 
From CaseStudyOne..Ride
Group by member_casual
Order by member_casual Desc

-- count of 3 types
select member_casual, rideable_bike, COUNT(*) as BicycleTypeCount
From Ride
Group by member_casual, rideable_bike


-- Average length of member_casual
Select member_casual, AVG(ride_length) as AverageLength
From Ride
Group by member_casual
Order by member_casual Desc


-- number of seasons
Select member_casual, ride_season, count(*) As NumberOfSeason
From Ride
Group by member_casual, ride_season
Order by member_casual Desc

-- avglength of season

Select member_casual, ride_season, AVG(ride_length) As AvgSeason
From Ride
Group by member_casual, ride_season
Order by member_casual Desc, ride_season 

-- number of month
Select member_casual, ride_month, count(*) As NumberOfSeason
From Ride
Group by member_casual, ride_month
Order by member_casual Desc, ride_month

-- avglength of month

Select member_casual, ride_month, AVG(ride_length) As AvgSeason
From Ride
Group by member_casual, ride_month
Order by member_casual Desc, ride_month

-- number of weekday
Select member_casual, ride_weekday, count(*) As NumberOfWeekday
From Ride
Group by member_casual, ride_weekday
Order by member_casual Desc, ride_weekday

-- avglength of weekday

Select member_casual, ride_weekday, AVG(ride_length) As AvgWeekday
From Ride
Group by member_casual, ride_weekday
Order by member_casual Desc, ride_weekday

-- -- number of hour
Select member_casual, ride_hour, count(*) As NumberOfHour
From Ride
Group by member_casual, ride_hour
Order by member_casual Desc, ride_hour

-- avglength of hour

Select member_casual, ride_hour, AVG(ride_length) As AvgWeekday
From Ride
Group by member_casual, ride_hour
Order by member_casual Desc, ride_hour

-- Seanson Hour Number
Select member_casual, ride_season, ride_hour, count(*) As NumberOfHour
From Ride
Group by member_casual, ride_season,ride_hour
Order by member_casual Desc, ride_season Desc,ride_hour


-- Top(10) Start station
Select Top(10) member_casual, start_station_name, Count(*) number, avg(end_lat), avg(end_lng)
From Ride
Where start_station_name is not Null
Group by member_casual, start_station_name
Order by member_casual, Count(*) Desc

Select Top(10) member_casual, start_station_name, Count(*) number, avg(end_lat), avg(end_lng)
From Ride
Where start_station_name is not Null
Group by member_casual, start_station_name
Order by member_casual Desc, Count(*) Desc

-- Top(10) End station
Select Top(10) member_casual, end_station_name, Count(*) number, avg(end_lat), avg(end_lng)
From Ride
Where end_station_name is not Null
Group by member_casual, end_station_name
Order by member_casual, Count(*) Desc


Select Top(10) member_casual, end_station_name, Count(*) number, avg(end_lat), avg(end_lng)
From Ride
Where end_station_name is not Null
Group by member_casual, end_station_name
Order by member_casual Desc, Count(*) Desc