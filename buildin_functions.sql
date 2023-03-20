/*
tenemos varias funciones build in 
para el manejo de datos
*/
SELECT  SalesOrderID,
    OrderDate,
        YEAR(OrderDate) AS OrderYear,
        DATENAME(mm, OrderDate) AS OrderMonth,
        DAY(OrderDate) AS OrderDay,
        DATENAME(dw, OrderDate) AS OrderWeekDay,
        DATEDIFF(yy,OrderDate, GETDATE()) AS YearsSinceOrder
FROM Sales.SalesOrderHeader;

SELECT TaxAmt,
       ROUND(TaxAmt, 0) AS Rounded,
       FLOOR(TaxAmt) AS Floor,
       CEILING(TaxAmt) AS Ceiling,
       SQUARE(TaxAmt) AS Squared,
       SQRT(TaxAmt) AS Root,
       LOG(TaxAmt) AS Log,
       TaxAmt * RAND() AS Randomized
FROM Sales.SalesOrderHeader;

SELECT  CompanyName,
        UPPER(CompanyName) AS UpperCase,
        LOWER(CompanyName) AS LowerCase,
        LEN(CompanyName) AS Length,
        REVERSE(CompanyName) AS Reversed,
        CHARINDEX(' ', CompanyName) AS FirstSpace,
        LEFT(CompanyName, CHARINDEX(' ', CompanyName)) AS FirstWord,
        SUBSTRING(CompanyName, CHARINDEX(' ', CompanyName) + 1, LEN(CompanyName)) AS RestOfName
FROM Sales.Customer;

/*
IIF retorna un valor si es True u otro si es False 
*/
SELECT AddressType,
      IIF(AddressType = 'Main Office', 'Billing', 'Mailing') AS UseAddressFor
FROM Sales.CustomerAddress;

/*
CHOSE retorna un valor segun su indice 
1 Ordered
2 Shipped
3 Delivered
*/
SELECT SalesOrderID, Status,
CHOOSE(Status, 'Ordered', 'Shipped', 'Delivered') AS OrderStatus
FROM Sales.SalesOrderHeader;

/*
RANK permite rankear el resultado 
*/
SELECT TOP 100 ProductID, Name, ListPrice,
RANK() OVER(ORDER BY ListPrice DESC) AS RankByPrice
FROM Production.Product AS p
ORDER BY RankByPrice;

/*
ROWSETS functions nos permite utilizar otras 
fuentes de datos como bases de datos en otro servidor 
XML o JSON 
OPENDATASOURCE, OPENQUERY, OPENROWSET, OPENXML, and OPENJSON.
*/
SELECT a.*
FROM OPENROWSET('SQLNCLI', 'Server=SalesDB;Trusted_Connection=yes;',
    'SELECT Name, ListPrice
    FROM AdventureWorks.Production.Product') AS a;

/*
aggregate functions sirven para retornar un solo valor 
*/
SELECT AVG(ListPrice) AS AveragePrice,
       MIN(ListPrice) AS MinimumPrice,
       MAX(ListPrice) AS MaximumPrice
FROM Production.Product;

/*
esta daria un error porque no estamos agrupando por ProductCategoryID
Msg 8120, Level 16, State 1, Line 1
Column 'Production.ProductCategoryID' is invalid in the select list because 
it isn't contained in either an aggregate function or the GROUP BY clause.
*/
SELECT ProductCategoryID, AVG(ListPrice) AS AveragePrice,
MIN(ListPrice) AS MinimumPrice,
MAX(ListPrice) AS MaximumPrice
FROM Production.Product;

/*
contando los valores unicos
*/
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader;

/*
GROUP BY
*/
SELECT CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID;

/*
The clauses in a SELECT statement are applied in the following order:
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

/*
1.- daria error porque purchaseOrderNumber tiene multiples valores
2.- la siguiente no da error porque ya se agrupa CustomerID y PurchaseOrderNumber
*/
SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, PurchaseOrderNumber;

/*
HAVING es como filtrar sobre los grupos 
aqui esta filtrando los CustomerID que tengan mas de 10 
compras 
*/
SELECT CustomerID,
      COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 10;
