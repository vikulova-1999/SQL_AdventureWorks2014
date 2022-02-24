/*
SELECT
COALESCE( c.Name, 'Итого') 'Название категории',
COUNT (s.ProductCategoryID) 'Количество продуктов в категории',
SUM (p.Weight) 'Суммарный вес на категорию',
AVG (p.Weight) 'Средний вес на категорию'
FROM AdventureWorks2014.Production.ProductCategory c,
AdventureWorks2014.Production.ProductSubcategory s,
AdventureWorks2014.Production.Product p
WHERE s.ProductCategoryID = c.ProductCategoryID AND s.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY c.Name WITH ROLLUP
*/

SELECT
COALESCE( c.Name, 'Итого') 'Название категории',
COUNT (s.ProductCategoryID) 'Количество продуктов в категории',
SUM (p.Weight) 'Суммарный вес на категорию',
AVG (p.Weight) 'Средний вес на категорию'
FROM AdventureWorks2014.Production.ProductCategory c
INNER JOIN AdventureWorks2014.Production.ProductSubcategory s
ON s.ProductCategoryID = c.ProductCategoryID
INNER JOIN AdventureWorks2014.Production.Product p
ON s.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY c.Name  WITH ROLLUP