-- choose the database
Use CaseStudyOne

-- Create the table
Create table ride_202106( 
ride_id  nvarchar(255)
,rideable_bike nvarchar(255)
,started_at datetime
,ended_at datetime
,start_station_name nvarchar(255)
,start_station_id nvarchar(255)
,end_station_name nvarchar(255)
,end_station_id nvarchar(255)
,start_lat float
,start_lng float
,end_lat float
,end_lng float
,member_casul nvarchar(255)
)



Select * 
From ride

-- ImportData recent 1 year


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202106-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n'   --Use to shift the control to next row
	TABLOCK
);

BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202107-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202108-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)




BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202109-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202110-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202111-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202112-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202201-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202202-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202203-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202204-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT ride
FROM 'C:\Users\heson\Desktop\CaseStudy1\data\202205-divvy-tripdata.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

-- Formatting data

Select started_at, CAST(started_at as date) , CAST(started_at as time)
From ride



Alter Table ride
Add start_day date
,start_time time
,end_day date
,end_time time

Update ride
Set start_day = CAST(started_at as date)
, start_time = CAST(started_at as time)
,end_day = CAST(ended_at as date)
, end_time = CAST(ended_at as time)

select Top(100) *
From ride

-- Populate station_name
Select 
start_station_name 
, start_station_id 
From ride
Where 
(start_station_name is null and start_station_id is not null) 
or (start_station_name is not null and start_station_id is  null)
or (end_station_name is null and end_station_id is not null) 
or (end_station_name is not null and end_station_id is  null)

Select 

 a.start_station_name
, b.start_station_name 
From ride a
Join ride b
On a.start_station_id = b.start_station_id
Where a.start_station_id in ('13221', '20215', 'WL-008')
and a.start_station_name is null 
and b.start_station_name is not null 

update a
Set a.start_station_name = b.start_station_name
From ride a
Join ride b
On a.start_station_id = b.start_station_id
and a.ride_id <> b.ride_id
Where a.start_station_id in ('13221', '20215', 'WL-008')
and a.start_station_name is null 
and b.start_station_name is not null 



-- try the code of population
create table Populate
(sn int
,id nvarchar(255)
,name1 nvarchar(255)
)

Insert into Populate
values
(1, '1', 'yes', 1),
(2, '1', null, 2),
(3, '1', 'yes', 3),
(4, '1', null, 4)

select *
from Populate

delete from Populate

Select
distinct
a.sn 
--,a.id, b.id
, a.name1, b.name1
From Populate a
Join Populate b
ON a.id = b.id
where a.name1 is null 
and b.name1 is not null





--Remove duplicat
Select *, ROW_NUMBER() 
over(
Partition by 
rideable_bike
,started_at
,ended_at
,start_station_name
,end_station_name
Order by ride_id) row_num
From ride
--where row_num >1

With RideRowCte as
(
Select *, ROW_NUMBER() 
over(
Partition by 
rideable_bike
,started_at
,ended_at
,start_station_name
,end_station_name
Order by ride_id) row_num
From ride
)
select * 
From RideRowCte
Where row_num > 1



With RideRowCte as
(
Select *, ROW_NUMBER() 
over(
Partition by 
rideable_bike
,started_at
,ended_at
,start_station_name
,end_station_name
Order by ride_id) row_num
From ride
)
delete
From RideRowCte
Where row_num > 1







-- Add ride_length
alter Table ride
add ride_length float

select ride_id, Cast(DATEDIFF(minute, started_at, ended_at) as float)
From ride

update ride
Set ride_length = Cast(DATEDIFF(minute, started_at, ended_at) as float)

-- clean ride_length > 1440,  ride_length < 2
Select ride_length
From ride
Where ride_length >1440
or ride_length <2

delete 
From ride
Where ride_length >1440
or ride_length <2

-- add weekday
alter Table ride
Add ride_weekday nvarchar(255)



select Top(10) *
From ride


Select ride_weekday, DATENAME(weekday, Cast(started_at as date))
From ride

Update ride
Set ride_weekday = DATENAME(weekday, start_day)



--Add month column
Alter Table ride
Drop Column ride_month


Alter Table ride
Add ride_month int

Select ride_month, Month(started_at)
From ride

Update ride
Set ride_month = Month(started_at)

--Alter Table ride
--Alter column ride_month int


-- Add Season
Alter Table ride
Alter column ride_season nvarchar(255)

Select Top(100) * 
From ride


Select distinct ride_season, ride_month, 
Case When ride_month in (12, 1, 2) Then 'winter'
	When ride_month in (3, 4, 5) Then 'Spring'
	When ride_month in (6, 7, 8) Then 'Summer'
	Else 'Fall'
	End season
From ride
Order by ride_month

Update ride 
Set ride_season = Case When ride_month in (12, 1, 2) Then 'winter'
	When ride_month in (3, 4, 5) Then 'Spring'
	When ride_month in (6, 7, 8) Then 'Summer'
	Else 'Fall'
	End 




-- Add ride_distance
Select	Top(10) SQRT(POWER(69.1 * ( end_lat - start_lat),  2) + POWER(69.1 * ( start_lng  - end_lng )  * COS(end_lat / 57.3), 2)) , *
From ride

--distance
--SQRT(POWER(69.1 * ( @destinationLatitude - @sourceLatitude),  2) + POWER(69.1 * ( @sourceLongitude  - @destinationLongitude )  * COS(@destinationLatitude / 57.3), 2))



--Add hour
Alter Table ride
Add ride_hour int


Select started_at, ride_hour, Datepart(hour, started_at)
From ride

Update ride
Set ride_hour = Datepart(hour, started_at)


--Creat RideNoNull

Delete 
From RideNoNull

Drop Table RideNoNull



select COUNT(*)
From ride
Where start_station_name is null 
or start_station_id is  null
or end_station_name is null 
or end_station_id is null


Select * 
Into Ride
From ride



-- no need clean Ride because some bike dockless





select COUNT(*)
From RideNoNull
Where start_station_name is null 
or start_station_id is  null
or end_station_name is null 
or end_station_id is null

Delete
From RideNoNull
Where start_station_name is null 
or start_station_id is  null
or end_station_name is null 
or end_station_id is null

Select Count(*)
From RideNoNull








Select *
From RideNoNull
Where started_at is null
or ended_at is null
or start_station_name is null
Or end_station_name is null
or start_lat is null
or end_lat is null
or start_lng is null
or end_lng is null




Select Top(110) *
From RideNoNull




-- Delete unusable columns

Alter Table ride
Drop COlUMN end_time

Alter Table ride
Drop COlUMN end_day, start_day, start_time