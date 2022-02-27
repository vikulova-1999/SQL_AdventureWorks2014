--1 вариант - вывод в виде таблицы
WITH XMLNAMESPACES ('http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume' AS ns)
SELECT 
JobCandidateID,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Prefix)[1]', 'nvarchar(100)') Prefix,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.First)[1]', 'nvarchar(100)') FirstName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Middle)[1]', 'nvarchar(100)') Middle,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Last)[1]', 'nvarchar(100)') LastName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Suffix)[1]', 'nvarchar(100)') Suffix,
y.Education.value('(ns:Edu.Level)[1]', 'nvarchar(100)') EducationLevel,
y.Education.value('(ns:Edu.StartDate)[1]', 'nvarchar(100)') StartDate,
y.Education.value('(ns:Edu.EndDate)[1]', 'nvarchar(100)') EndDate,
y.Education.value('(ns:Edu.Degree)[1]', 'nvarchar(100)') Degree,
y.Education.value('(ns:Edu.School)[1]', 'nvarchar(100)') School,
CASE WHEN BusinessEntityID IS NOT NULL THEN 'Yes'
ELSE 'No'
END 'ѕрин€т на работу'
FROM   
    [AdventureWorks2014].[HumanResources].[JobCandidate]
CROSS APPLY
    [Resume].nodes('/ns:Resume/ns:Education') AS y(Education)


--2 вариант - вывод в виде XML
/*
WITH XMLNAMESPACES ('http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume' AS ns)
SELECT JobCandidateID, 
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Prefix)[1]', 'nvarchar(100)') Prefix,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.First)[1]', 'nvarchar(100)') FirstName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Middle)[1]', 'nvarchar(100)') Middle,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Last)[1]', 'nvarchar(100)') LastName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Suffix)[1]', 'nvarchar(100)') Suffix,

y.Education.value('(ns:Edu.Level)[1]', 'nvarchar(100)') EducationLevel,
y.Education.value('(ns:Edu.StartDate)[1]', 'nvarchar(100)') StartDate,
y.Education.value('(ns:Edu.EndDate)[1]', 'nvarchar(100)') EndDate,
y.Education.value('(ns:Edu.Degree)[1]', 'nvarchar(100)') Degree,
y.Education.value('(ns:Edu.School)[1]', 'nvarchar(100)') School,
CASE WHEN BusinessEntityID IS NOT NULL THEN 'Yes'
ELSE 'No'
END 'ѕрин€т на работу'
FROM [AdventureWorks2014].[HumanResources].[JobCandidate]
CROSS APPLY
[Resume].nodes('/ns:Resume/ns:Education') AS y(Education) FOR XML AUTO
*/


