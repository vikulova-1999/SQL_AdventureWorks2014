SELECT 
v.Name 'Поставщик',
p.Name 'Название продукта',
SUM(sod.LineTotal*pv.OnOrderQty) 'Суммарная цена сделок',
COUNT(pv.OnOrderQty) 'Общее число сделок'

FROM 
AdventureWorks2014.Sales.SalesOrderDetail sod
INNER JOIN AdventureWorks2014.Production.Product p
ON sod.ProductID = p.ProductID
INNER JOIN AdventureWorks2014.Purchasing.ProductVendor pv
ON p.ProductID = pv.ProductID
INNER JOIN AdventureWorks2014.Purchasing.Vendor v
ON pv.BusinessEntityID = v.BusinessEntityID
GROUP BY  p.Name, v.Name 