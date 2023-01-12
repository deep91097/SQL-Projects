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

CREATE TABLE Employee    (     [ID] INT identity(1,1),     [FirstName] Varchar(100),     [LastName] Varchar(100),     [Country] Varchar(100),     )             Insert into Employee ([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),                                ('Raj','Gupta','India'),                                ('Mohan','Kumar','USA'),                                ('James','Barry','UK'),                                ('James','Barry','UK'),                                ('James','Barry','UK')Select *from Employee

DELETE FROM Employee    WHERE ID IN    (        SELECT count(ID),ID        FROM Employee         GROUP BY [FirstName] having count(ID) > 1);
	
go
DROP Table [dbo].[Employee]
DELETE FROM Employee    WHERE ID NOT IN    (        SELECT MAX(ID) AS MaxRecordID        FROM Employee        GROUP BY [FirstName],                  [LastName],                  [Country]);


alter table [dbo].[Customers] add ID INT IDENTITY(1,1)
go
select * from [dbo].[Customers]
go
DELETE FROM [dbo].[Customers]    WHERE ID NOT IN    (        SELECT MAX(ID) AS MaxRecordID        FROM [dbo].[Customers]        GROUP BY [Customer ID],                  [Customer Name],                  [Segment]);				 goalter table [dbo].[Locations] add ID INT IDENTITY(1,1)goselect * from [dbo].[Locations]goDELETE FROM [dbo].[Locations]    WHERE ID NOT IN    (        SELECT MAX(ID) AS MaxRecordID        FROM [dbo].[Locations]        GROUP BY [Postal Code],                                   [city],				 [State],				 [Region],				 [Country]);goalter table [dbo].[Orders] add ID INT IDENTITY(1,1)select * from [dbo].[Orders]goDELETE FROM [dbo].[Orders]    WHERE ID NOT IN    (        SELECT MAX(ID) AS MaxRecordID        FROM [dbo].[Orders]        GROUP BY [Order ID],                                   [Order Date],				 [Ship Date],				 [Ship Mode]);goalter table [dbo].[Product] add ID INT IDENTITY(1,1)select * from [dbo].[Product]DELETE FROM [dbo].[Product]    WHERE ID NOT IN    (        SELECT MAX(ID) AS MaxRecordID        FROM [dbo].[Product]        GROUP BY [Product ID])goselect count(*) from [dbo].[Customers]select count(*) from [dbo].[Locations]select count(*) from [dbo].[Orders]select count(*) from [dbo].[Product]goselect * from [dbo].[Customers] where [Customer ID] is nullgoalter table [dbo].[Customers] alter column [Customer ID] nvarchar(255) not nullalter table [dbo].[Customers] add primary key([Customer ID])goalter table [dbo].[Locations] alter column [Postal Code] float not nullalter table [dbo].[Locations] add primary key([Postal Code])select count([Postal Code]) from [dbo].[Locations] goalter table [dbo].[Orders] alter column [Order ID] nvarchar(255) not nullalter table [dbo].[Orders] add primary key([Order ID])goalter table [dbo].[Product] alter column [Product ID] nvarchar(255) not nullalter table [dbo].[Product] add primary key([Product ID])goselect * into Locations1 from  [dbo].[Locations]--Drop table [dbo].[Locations]--select [Postal Code],[City],[State],[Region],[Country] into Locations from [dbo].[MasterData]select * from [dbo].[Product]select * from Locationsselect count([state]),[Postal Code] from [dbo].[Locations] group by [Postal Code]  order by count([state]) desc;select * from Locations where [Postal Code] = 92024update [dbo].[Locations] set [City] = 'San Diego' where [City] = 'Encinitas'goselect count([Category]),[Product ID] from [dbo].[Product] group by [Product ID] order by count([Category]) desc;goselect * from [dbo].[tbl_student1]delete from [dbo].[tbl_student1] where sname = ''goselect *,(Sales -Profit) as cost from Revenueselect *,CASE WHEN Profit > 100 then 'Yes' 		else 'No'		End As decision from Revenue select * from [dbo].[Customers] where [Customer Name] Like 'A%' select * from [dbo].[Customers] where [Customer Name] Like '_A%' select * from [dbo].[Customers] where [Customer Name] Like 'A%D' select * from [dbo].[Customers] where [Customer Name] Like 'D%' select * from [dbo].[Customers] where [Customer Name] Like '%D%'  select * from [dbo].[Customers] where [Customer Name] Like 'A_D%' select 1 go select *  From [dbo].[Customers] where [Customer Name] like '[AB]%'  select *  From [dbo].[Customers] where [Customer Name] like '[AXB]%'   select *  From [dbo].[Customers] where [Customer Name] like '[A-E]%' select *  From [dbo].[Customers] where [Customer Name] like '[^A-E]%'  select *  From [dbo].[Customers] where [Customer Name] like '^D[A-E]%' select *  From [dbo].[Customers] where [Customer Name] like '[AB]%' select *  From [dbo].[Customers] where [Customer Name] like '[A-E]%' alter table [dbo].[tbl_student1] add marks_per nvarchar(255) insert into [dbo].[tbl_student1](Roll_no,marks_per) values(3,'80%') select * from [dbo].[tbl_student1] select * from [dbo].[tbl_student1] where marks_per like '%80!%' Escape '!' select [Customer Name] + '-'+[Segment] from [dbo].[Customers] select * from [dbo].[Revenue] where Sales > 100 and Profit>50  select * from [dbo].[Revenue] where not Sales > 100 and not Profit>50 select *  From [dbo].[Customers] where [Customer Name] like '[A-CE-F]%' go select * from [dbo].[Orders] where [Order ID] is not null select * from [dbo].[Revenue] where sales between 200 and 500 select * from [dbo].[Revenue] where round(sales,2) in (244.55,419.21,391.28) go select * from [dbo].[MasterData] order by sales desc,profit  select * from [dbo].[MasterData] order by sales , segment -- wont work because we dont hv multiple sales values select * from [dbo].[MasterData] order by segment, Category go go alter table [dbo].[Revenue] add constraint fk_order foreign key ([Order ID]) references [dbo].[Orders]([Order ID]) go alter table [dbo].[Revenue] add constraint fk_product foreign key ([Product ID]) references [dbo].[Product]([Product ID]) go alter table [dbo].[Revenue] add constraint fk_cust foreign key ([Customer ID]) references [dbo].[Customers]([Customer ID]) go alter table [dbo].[Revenue] add constraint fk_ foreign key ([Postal Code]) references [dbo].[Locations]([Postal Code]) go select [Customer Name],sum([Sales]) from [dbo].[MasterData] group by [Customer Name]  go select distinct upper([Segment]) from [dbo].[MasterData]  select distinct lower([Segment]) from [dbo].[MasterData]   select distinct len([Segment]) from [dbo].[MasterData]    select round(sales,3) from [dbo].[MasterData]	 select max(round(sales,2)) from [dbo].[MasterData]	 select format(1234,'##-##') from [dbo].[MasterData]	 select format(25,'N')  select [Order ID],sum(sales) AS tot_sales from [dbo].[Revenue] group by rollup ([Order ID]) select [Order ID],sum(sales) AS tot_sales from [dbo].[Revenue] group by rollup ([Order ID]) having sum(Sales)<1.5-- rol up doesnt work with conditions  select coalesce([Customer Name],'total_sales'),sum(sales) AS tot_sales from [dbo].[MasterData] group by rollup ([Customer Name])  select distinct segment,category,sum(sales) over (partition by category) as TS from  [dbo].[MasterData] order by Category   select distinct segment,category,sum(sales) over (partition by category) as TS from  [dbo].[MasterData] order by Sales desc    select distinct segment,category,sum(sales) over (partition by segment) as TS from  [dbo].[MasterData] order by segment  select segment,category, sum(sales) from [dbo].[MasterData] group by segment,category  create table students(RN varchar(15),Marks int)insert into students4values(1,80),(2,40),(3,50),(4,60),(5,30)select * from students

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
Create table Employees(EmpID varchar(255),FN varchar(255),Salary int,Managerid varchar(255))

Insert into EmployeesValues(1, 'Bharti', 1000, 3), (2, 'Deepak', 1500, 3), (3, 'Adhyan', 1800, 4)Insert into Employees (EmpID, FN, Salary)Values(4, 'Surya', 1200)Insert into EmployeesValues(5, 'Devshree', 1400, 1)select * from Employees

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e join [dbo].[Employees] m on e.EmpID=m.EmpID

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e join [dbo].[Employees] m on e.EmpID=m.Managerid--right

select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e left join [dbo].[Employees] m on e.EmpID=m.Managerid--wrong
select * from Employees
select e.EmpID,e.FN, e.Salary,m.FN from [dbo].[Employees] e right join [dbo].[Employees] m on e.EmpID=m.Managerid--wrong
select * from Employees

go
create table Details1(Product_id varchar(255),Product_name varchar(255),category varchar(255),List_price int)Insert into Details1Values('P1', 'Pencil','1', 200), ('P2', 'Pen','2', 300),  ('P3', 'Erazer','3', 250), ('P4', 'Sharpener','1', 400),('P5', 'Notebook','2', 380), ('P6', 'Pen','3', 350)
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
CREATE DATABASE database_1CREATE TABLE database_1.dbo.products (	product_id int primary key,	product_name nvarchar(50))INSERT INTO database_1.dbo.products (product_id, product_name)VALUES(1, 'Laptop'),(2, 'Tablet'),(3, 'Monitor'),(4, 'Printer'),(5, 'Keyboard')SELECT * FROM database_1.dbo.products
go
CREATE DATABASE database_2CREATE TABLE database_2.dbo.prices (	product_id int primary key,	product_price int)INSERT INTO database_2.dbo.prices (product_id, product_price)VALUES(1, 1200),(2, 300),(3, 500),(4, 150),(5, 80)SELECT * FROM database_2.dbo.prices

select t1.product_id,t1.product_name,t2.product_price from database_1.dbo.products t1 left join database_2.dbo.prices t2 on t1.product_id = t2.product_id
go
CREATE DATABASE SqlShackMergeDemo
go
CREATE TABLE SourceProducts(    ProductID INT,    ProductName VARCHAR(50),    Price DECIMAL(9,2))    INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
go
CREATE TABLE TargetProducts(    ProductID INT,    ProductName VARCHAR(50),    Price DECIMAL(9,2))    INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)

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
Q3: 5 typesSingle row subquery: Returns zero or one row.Multiple row subquery: Returns one or more rows.Multiple column subqueries: Returns one or more columns.Correlated subqueries: Reference one or more columns in the outer SQL statement. The subquery is known as a correlated subquery because the subquery is related to the outer SQL statement.Nested subqueries: Subqueries are placed within another subquery.
'''

go
select count([Order ID]) from [dbo].[MasterData] where Sales > (Select sum(Sales) from [dbo].[MasterData] )
go
select count(*) as C from (select [order id], sum(sales) as TS from [dbo].[Revenue] group by [order id] having sum(sales)>10000) a
select 1
go
select Detail.category as Category ,max(Detail.List_price) as Price  from Details Detailjoin Details Pop on Detail.Product_id = Pop.Product_idgroup by Detail.category;
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