select top 10 sum(sod.orderqty) as TotalOrderAmount, cus.customerid, concat(cus.firstname,' ', cus.lastname) from [SalesLT].[Customer] cus
join [SalesLT].[SalesOrderHeader] soh
on soh.customerid = cus.customerid
join [SalesLT].[SalesOrderDetail] sod
on sod.salesorderid = soh.salesorderid
group by cus.customerid, cus.firstname, cus.lastname

select year(sod.ModifiedDate) as Year, month(sod.ModifiedDate) as Month, sum(sod.orderqty) as 'Order Quantity'
from [SalesLT].[Customer] cus
join [SalesLT].[SalesOrderHeader] soh
on soh.customerid = cus.customerid
join [SalesLT].[SalesOrderDetail] sod
on sod.salesorderid = soh.salesorderid
group by sod.modifieddate

select sum(sod.orderqty) as 'Total Amount', prod.name
from [SalesLT].[SalesOrderDetail] sod
join [SalesLT].[Product] prod 
on prod.productid = sod.productid
group by prod.name
having sum(sod.orderqty) > 20
order by prod.name