
select * from Person where Email like '_@_-com'


select * from Person where Name like '[^WAS]%'
select * from Person


select * from Person where City = 'Gotham' or City = 'New York'


select * from Person where City = 'Gotham' or City = 'New York' and Age >= 30


select * from Person order by Name


select * from Person order by Name desc 

--v�tab kolm esimest rida
select top 3 * from Person 

--kolm esimest, aga tabeli j�rjestus on Age ja siis Name
select top 3 Age, Name from Person

--n�itab esimesed 50% tabelist
select top 50 percent * from Person 

--j�rjestab vanuse j�rgi isikud
select * from Person order by Age desc

--muudab Age muutuja intiks ja n�itab vanuselises j�rjestuses
select * from Person order by cast(Age as int)

--k�ikide isikute koondvanus
select sum(cast(Age as int)) from Person

--kuvab k�ige nooremat isikut
select min(cast(Age as int)) from Person

--kuvab k�ige vanemat isikut
select max(cast(Age as int)) from Person

--konkreetsetes linnades olevate isikute koondvanus
--enne oli Age nvarchar, aga muudame selle int andmet��biks
select City, SUM(Age) as totalAge from Person group by City

--kuidas saab koodiga andmet��pi ja selle pikkust
alter table Person 
alter column Name nvarchar(25)

--kuvab esimeses reas v�lja toodud j�rjestuses ja kuvab Age TotalAge-ks
--j�rjestab City-s olevate nimede j�rgi ja siis GenderId j�rgi
select City, GenderId,SUM(Age) as TotalAge from Person
group by City, GenderId order by City

--n�itab ridade arvu tabelis
select COUNT(*) from Person
select * from Person

--n�itab tulemust, et mitu inimest on genderId v��rtusega 2 konkreetses linnas
--arvutab vanuse kokku selles linnas
select GenderId, City, sum(Age) as TotalAge, count(Id) as [Total Person(s)]
from Person 
where GenderId = '2'
group by GenderId, City

--loome tabelid Employees ja Department
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary nvarchar(50),
DepartmentId int
)