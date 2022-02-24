--3.1 AND 3.2
SELECT d.GroupName 'Название группы отделов',
e.JobTitle  'Название должности', 
COUNT (*) 'Количество человек',
NULL 'Число работающих в организации',
NULL'Число не работающих в организации'
FROM AdventureWorks2014.HumanResources.Department d
INNER JOIN AdventureWorks2014.HumanResources.EmployeeDepartmentHistory edh
ON (d.DepartmentID = edh.DepartmentID)
INNER JOIN AdventureWorks2014.HumanResources.Employee e
ON (e.BusinessEntityID = edh.BusinessEntityID)
GROUP BY GROUPING SETS  ((e.JobTitle), (d.GroupName))
UNION ALL
--3.3 AND 3.4
SELECT NULL, NULL, NULL, COUNT (*),NULL
FROM AdventureWorks2014.Person.Person p
INNER JOIN AdventureWorks2014.HumanResources.Employee e
ON e.BusinessEntityID = p.BusinessEntityID
UNION ALL
SELECT NULL, NULL, NULL, NULL, COUNT (*) 
FROM AdventureWorks2014.Person.Person p
LEFT JOIN AdventureWorks2014.HumanResources.Employee e
ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.BusinessEntityID IS NULL
