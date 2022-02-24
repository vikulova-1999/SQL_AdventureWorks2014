WITH XMLNAMESPACES ('http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume' AS ns)
SELECT JobCandidateID,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Prefix)[1]', 'nvarchar(100)') Prefix,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.First)[1]', 'nvarchar(100)') FirstName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Middle)[1]', 'nvarchar(100)') Middle,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Last)[1]', 'nvarchar(100)') LastName,
[Resume].value('(/ns:Resume/ns:Name/ns:Name.Suffix)[1]', 'nvarchar(100)') Suffix,
[Resume].value('(/ns:Resume/ns:Education/ns:Edu.Level)[1]', 'nvarchar(100)') EducationLevel,
[Resume].value('(/ns:Resume/ns:Education/ns:Edu.StartDate)[1]', 'nvarchar(100)') StartDate,
[Resume].value('(/ns:Resume/ns:Education/ns:Edu.EndDate)[1]', 'nvarchar(100)') EndDate,
[Resume].value('(/ns:Resume/ns:Education/ns:Edu.Degree)[1]', 'nvarchar(100)') Degree,
[Resume].value('(/ns:Resume/ns:Education/ns:Edu.School)[1]', 'nvarchar(100)') School,

CASE WHEN BusinessEntityID IS NOT NULL THEN 'Да'
ELSE 'Нет'
END 'Принят на работу'

FROM [AdventureWorks2014].[HumanResources].[JobCandidate];
