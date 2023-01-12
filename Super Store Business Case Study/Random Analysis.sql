Create database AV_B9
go

--DROP DATABASE AV_B9
ALTER DATABASE [MyCutomerDB] modify name = My_Customer_DB
go
--DROP TABLE tbl_student
go
CREATE TABLE tbl_student(
Roll_no varchar(5) primary key,
sname varchar(15) not null,
marks int check(marks<=100),
city varchar(10) default('delhi')
) 
go
insert into tbl_student1 values(1,'Deep',90,'Siliguri'),(2,'Dhar',80,'Jaipur')
insert into tbl_student1(Roll_no,sname,marks) values(3,'',90)
insert into tbl_student1(Roll_no,sname,marks) values(4,'Bharti',102)
select * from tbl_student1 

select count(*) from tbl_student1
select avg(marks) from tbl_student1
go
alter table tbl_student1 add section varchar(5)
go\
select * from tbl_student1
ALTER TABLE tbl_student1 alter column sname varchar(20)
go

select * from tbl_student1;

alter table tbl_student1 drop column section

delete tbl_student

--drop table tbl_student
select * from tbl_student3

select * into tbl_student3 from tbl_student1

Truncate table tbl_student3

alter table tbl_student1 alter column sname varchar(20) not null
go
alter table tbl_student1 add constraint u_sname unique(sname)
go
alter table tbl_student1 drop [DF__tbl_studen__city__267ABA7A]
go
alter table tbl_student1 add constraint df_city default 'Delhi' for city
go
alter table tbl_student1  drop [CK__tbl_stude__marks__25869641]
go
alter table tbl_student1 add constraint ch_marks check(marks <= 100)
go
alter table tbl_student1 drop [PK__tbl_stud__28B56405E2908025]
go
alter table tbl_student1 add primary key (Roll_No,sname)
go
alter table tbl_student1 alter column sname varchar(20)
go

alter table tbl_student1 drop [PK__tbl_stud__1844895D640A5979]

select [Order ID],[Order Date],[Ship Date],[Ship Mode] into Orders from [dbo].[MasterData]
go
select * from Orders
select [Customer ID],[Customer Name],[Segment] into Customers from [dbo].[MasterData]
go
select [Country],[City],[State],[Postal Code],[Region] into Locations from [dbo].[MasterData]
go
select [Product ID],[Product Name],[Category],[Sub-Category] into Product from [dbo].[MasterData]
go
select [Order ID],[Customer ID],[Postal Code],[Product ID],[Sales],[Profit] into Revenue from [dbo].[MasterData]
go
select * from MasterData where [Postal Code] = 05408
go
select * from [dbo].[Locations] where [Postal Code] = 05408
go
select * from [dbo].[Product] where [Product ID] is null
go
select * from [dbo].[Customers] where [Customer ID] is null
go
update [dbo].[MasterData] set [Postal Code] = 05408 where State = 'Vermont'
go

CREATE TABLE Employee

DELETE FROM Employee
	
go
DROP Table [dbo].[Employee]
DELETE FROM Employee


alter table [dbo].[Customers] add ID INT IDENTITY(1,1)
go
select * from [dbo].[Customers]
go
DELETE FROM [dbo].[Customers]

select RN, Marks, ROW_NUMBER() over(order by Marks) from students

select RN, Marks, Rank() over(order by Marks desc) from students

select RN, Marks, Dense_rank() over(order by Marks) from students

select RN, Marks, ntile(3) over(order by Marks) from students

select count(*),[Order ID] from [dbo].[MasterData]  group by [Order ID] having sum(sales)>10000

select * from [dbo].[MasterData] where sales > 10000

create table emp(
EMP_ID int,
NAME varchar(20),
job varchar(20),
salary int )

select * from emp

insert into emp (EMP_ID, NAME, JOB, SALARY)
values
(201, 'ANIRUDDHA', 'ANALYST', 2100),
(212, 'LAKSHAY', 'DATA ENGINEER', 2700),
(209, 'SIDDHARTH', 'DATA ENGINEER', 3000),
(232, 'ABHIRAJ', 'DATA SCIENTIST', 2500),
(205, 'RAM', 'ANALYST', 2500),
(222, 'PRANAV', 'MANAGER', 4500),
(202, 'SUNIL', 'MANAGER', 4800),
(233, 'ABHISHEK', 'DATA SCIENTIST', 2800),
(244, 'PURVA', 'ANALYST', 2500),
(217, 'SHAROON', 'DATA SCIENTIST', 3000),
(216, 'PULKIT', 'DATA SCIENTIST', 3500),
(200, 'KUNAL', 'MANAGER', 5000);

select *,
LEAD(salary, 1) Over(partition by job order by salary) as sal_next
from emp;

select *,
LAG(salary, 1) Over(partition by job order by salary) as sal_previous,LEAD(salary, 1) Over(partition by job order by salary),
salary - LAG(salary, 1) Over(partition by job order by salary) as sal_diff
from emp;
select * from [dbo].[tbl_student1]
select * from [dbo].[students]

select * from [dbo].[students]
union 
select * from [dbo].[students4]
go
select * from [dbo].[students]
union all
select * from [dbo].[students4]

go
select * from [dbo].[students]
intersect
select * from [dbo].[students4]
go
select * from [dbo].[students]
except
select * from [dbo].[students4]
go
select * from [dbo].[students4]
except
select * from [dbo].[students]

select * from [dbo].[Revenue] r left outer join [dbo].[Customers] c 
on r.[Customer ID] = c.[Customer ID]

go
select * from [dbo].[Revenue] r right join [dbo].[Customers] c 
on r.[Customer ID] = c.[Customer ID]
go
select * from [dbo].[Revenue] r full join [dbo].[Customers] c 
on r.[Customer ID] = c.[Customer ID]
go

select * from [dbo].[students] s1 inner join [dbo].[students4] s2 on s1.Marks>s2.Marks

select * from [dbo].[students] s1 inner join [dbo].[students4] s2 on s1.Marks=s2.Marks
go
select * from [dbo].[Revenue],[dbo].[Customers]--cross join

go
select * from [dbo].[Customers],[dbo].[Orders]--cross join


go
select * from [dbo].[Revenue] cross join [dbo].[Customers]
go
--self join
Create table Employees(

Insert into Employees

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e join [dbo].[Employees] m on e.EmpID=m.EmpID

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e join [dbo].[Employees] m on e.EmpID=m.Managerid--right

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e left join [dbo].[Employees] m on e.EmpID=m.Managerid--wrong
select * from Employees
select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e right join [dbo].[Employees] m on e.EmpID=m.Managerid--wrong
select * from Employees

go
create table Details1(
go 2
select * from Details1
select top 3 Product_name,category,max(List_price) from details group by category,Product_name order by max(List_price) desc 
select * from (
select Product_name,category,List_price,ROW_NUMBER() over(partition by category order by List_price desc) as rank_ from details) a where rank_ = 1


select  max(d.List_price),d.Product_name from details d join details t on d = t.Product_id group by t.category

select  d.Product_name,t.category,max(d.List_price) from details d join details t on d.category = t.category group by t.category,d.Product_name

create view vw_x
as 
select e.EmpID,e.FN as EFN, e.Salary,m.FN as MFN from [dbo].[Employees] e join [dbo].[Employees] m on e.EmpID=m.Managerid
go
select * from vw_x
go
select *,CASE WHEN sales>100 then 'Yes' else 'No' END from [dbo].[Revenue]
go
select DATEPART(Year,GETDATE()) as [year], DATEPART(MONTH,GETDATE()) as [MOnth], DATEPART(MS,GETDATE()) as [Milliseconds],
DATEPART(Day,GETDATE()) as [Day], DATEPART(HOUR,GETDATE())as [hour], DATEPART(MINUTE,GETDATE()) as [MiNUTE], DATEPART(SECOND,GETDATE())
go

select count(*),[Order Date] from Orders where [Order Date] = '2017-10-24' group by [Order Date]
select * from Orders
go
select DATEADD(month,7,GETDATE()) as seven_monthfrom_now,
DATEADD(day,-14,GETDATE()) as fourteen_days_back,
DATEADD(year,3,GETDATE()) as three_years_now,
DATEADD(MILLISECOND,3500,GETDATE()) as three_secs_frm_now,
DATEADD(QUARTER,-20,GETDATE()) as twebty_quarters_from_now,
DATEADD(WEEKDAY,37,GETDATE()) as thirty_Seven_weekdaysfrom_now
go

select [Order ID],[Order Date],[Ship Date],DATEDIFF(day,[Order Date],[Ship Date])as [days until shipped],
DATEDIFF(week,[Order Date],[Ship Date]) as [weeks untill shipped] from [dbo].[Orders]
go
CREATE DATABASE database_1
go
CREATE DATABASE database_2

select t1.product_id,t1.product_name,t2.product_price from database_1.dbo.products t1 left join database_2.dbo.prices t2 on t1.product_id = t2.product_id
go
CREATE DATABASE SqlShackMergeDemo
go
CREATE TABLE SourceProducts(
go
CREATE TABLE TargetProducts(

select * from SourceProducts
select * from TargetProducts

MERGE TargetProducts AS Target
USING SourceProducts AS Source
ON Source.ProductID = Target.ProductID
WHEN NOT MATCHED By Target THEN 
INSERT (ProductID,ProductName,Price)
values (Source.ProductID,Source.ProductName,Source.Price);
select RN,Marks from students4 where Marks > (select marks from students4 where RN = 2)
go
select a.RN from students4 a left join students4 b on a.RN =b.RN where a
go
'''
Q3: 5 types
'''

go
select count([Order ID]) from [dbo].[MasterData] where Sales > (Select sum(Sales) from [dbo].[MasterData] )
go
select count(*) as C from (select [order id], sum(sales) as TS from [dbo].[Revenue] group by [order id] having sum(sales)>10000) a
select 1
go
select Detail.category as Category ,max(Detail.List_price) as Price  from Details Detail
'''
Business Problem: Find out the customer ID & Name for the customer who has generated maximum sales in 2017

'''
select top 1 c.[Customer ID],c.[Customer Name],sum(sales) from Customers c join Revenue r on c.[Customer ID] = r.[Customer ID] join Orders o on o.[Order ID] = r.[Order ID]
where YEAR([Order Date]) = '2017' group by c.[Customer ID],c.[Customer Name] order by sum(Sales) desc
go
select [Customer ID], [Customer name] from Customers where [Customer ID] 
in (select top 1 [customer id] from Revenue where [Order ID] in 
(select [Order ID] from Orders where YEAR([order date]) = 2017)
group by [Customer ID] order by sum(sales) desc);
go
select 1 
go
select Top 5 c1.[Customer ID], sum(r1.[Sales]),c2.[Customer ID],sum(r2.[Profit]) from
[dbo].[Customers] c1 join [dbo].[Customers] c2 on
c1.[Customer ID]=c2.[Customer ID] join [dbo].[Revenue] r1 on c1.[Customer ID] = r1.[Customer ID] join [dbo].[Revenue] r2 on
c2.[Customer ID] = r2.[Customer ID] group by c1.[Customer ID],c2.[Customer ID] order by sum(r1.sales) desc, sum(r2.Profit) 

go
select 1
update [dbo].[students] set [Marks] = [Marks] + 20 where RN in (select RN  from [dbo].[students] where Marks in (Select MAX(Marks) from [dbo].[students]))

select * from [dbo].[students]  
create table customers_1(
cust_id varchar(3),
cust_name varchar(15),
city varchar(15),
salesman_id varchar(3))

insert into customers_1 values ('301','Nick','Ny','501'),('302','Nick','Ny','501'),('303','Nick','Ny','502'),('304','Nick','Ny','502'),('305','Nick','Ny','503')

create table salesman(
salesman_id varchar(3),
name varchar(15),
city varchar(15),
commission int) 

insert into salesman values ('501','James','Houston',10),('502','Scott','Texas',20),('501','Raju','california',15)
update salesman 

select salesman_id,name from salesman where salesman_id in (select salesman_id from customers_1 group by salesman_id having count(cust_id)>1)

select * from customers_1
select * from salesman

select count( distinct [Customer ID]) from [dbo].[Revenue] group by [Order ID] having count([Order ID]) > 30


select count(*) from (select [Customer ID],count([Order ID]) as countt from [dbo].[Revenue] group by [Customer ID] having count([Order ID]) > 30) a;

select (select sum(sales) from MD where Region='West')/(select sum(sales) from MD where Region='East')



 SELECT len(rtrim(' HelloWorld '));

SELECT len(trim(' HelloWorld '));

SELECT len(ltrim(' HelloWorld '));

SELECT len(ltrim(rtrim(' HelloWorld ')));