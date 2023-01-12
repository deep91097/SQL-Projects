

-- 1)	Are my top 5 customers profitable?

select top 5 c1.[Customer ID],c1.[Customer Name], SUM(r1.[Sales]) as Sales,
Format(SUM([Profit])/SUM(r1.[Sales]),'P') as Profit_Margin from [dbo].[Customers] c1
join [dbo].[Revenue] r1 on c1.[Customer ID] = r1.[Customer ID]
group by c1.[Customer ID],c1.[Customer Name] order by Sales desc,Profit_Margin
go

--2)	Find out the customer retention rate. The formula for the same is no. of repeat customers/number of total customers.
declare @rowcnt as INT
 select @rowcnt = count(distinct [Customer ID]) from [dbo].[Revenue]
select format(count(*)*1.0/@rowcnt,'P') as CRR from 
(select [Customer ID],count([Customer ID]) as cnt from [dbo].[Revenue] group by [Customer ID] having COUNT(distinct [Order ID]) > 1) a;
go


-- 3)	Which are the Top 10 cities with maximum number of Customers?
select * from Revenue
select top 10 l.[City] as city,count(distinct r.[Customer ID]) as no_of_customers from [dbo].[Locations] l join [dbo].[Revenue] r 
on l.[Postal Code] = r.[Postal Code] group by l.City order by 2 desc; 
go

-- 4)	Find out the Top 3 sub-categories of each category
select Category,[Sub-Category],Total_sales from (
select p.[Category],p.[Sub-Category],SUM(r.[Sales]) as Total_sales,
DENSE_RANK() OVER(Partition by p.[Category] order by sum(r.[Sales]) desc) as DN_rnk
from [dbo].[Product] p join [dbo].[Revenue] r on 
p.[Product ID] = r.[Product ID] group by p.Category,p.[Sub-Category] ) a where DN_rnk <4

-- 5)	Who are the customers who have not placed any orders in the last 2 months?

select [Customer ID],[Customer Name] from [dbo].[Customers] where [Customer ID] not in
(
select [Customer ID] from [dbo].[Revenue] r join [dbo].[Orders] o on r.[Order ID] = o.[Order ID] 
where o.[Order Date] > DATEADD(MONTH,-2,(select MAX([Order Date]) from [dbo].[Orders])))