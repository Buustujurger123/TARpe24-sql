
select * from Person where Email like '_@_-com'


select * from Person where Name like '[^WAS]%'
select * from Person


select * from Person where City = 'Gotham' or City = 'New York'


select * from Person where City = 'Gotham' or City = 'New York' and Age >= 30


select * from Person order by Name


select * from Person order by Name desc 

--võtab kolm esimest rida
select top 3 * from Person 

--kolm esimest, aga tabeli järjestus on Age ja siis Name
select top 3 Age, Name from Person

--näitab esimesed 50% tabelist
select top 50 percent * from Person 

--järjestab vanuse järgi isikud
select * from Person order by Age desc

--muudab Age muutuja intiks ja näitab vanuselises järjestuses
select * from Person order by cast(Age as int)

--kõikide isikute koondvanus
select sum(cast(Age as int)) from Person

--kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person

--kuvab kõige vanemat isikut
select max(cast(Age as int)) from Person

--konkreetsetes linnades olevate isikute koondvanus
--enne oli Age nvarchar, aga muudame selle int andmetüübiks
select City, SUM(Age) as totalAge from Person group by City

--kuidas saab koodiga andmetüüpi ja selle pikkust
alter table Person 
alter column Name nvarchar(25)

--kuvab esimeses reas välja toodud järjestuses ja kuvab Age TotalAge-ks
--järjestab City-s olevate nimede järgi ja siis GenderId järgi
select City, GenderId,SUM(Age) as TotalAge from Person
group by City, GenderId order by City

--näitab ridade arvu tabelis
select COUNT(*) from Person
select * from Person

--näitab tulemust, et mitu inimest on genderId väärtusega 2 konkreetses linnas
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