/*
filtrar por  NULL o NOT NULL 
*/
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductName IS  NULL;

SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductName IS NOT NULL;

/*
filtrar por multiples condicionales
*/
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE (ProductCategoryID = 2 OR ProductCategoryID = 3)
    AND (ListPrice < 10.00);

/*
filtrar por concidencias en una lista 
IN
*/
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductCategoryID IN (2, 3, 4);

/*
filtrar por valores entre dos limites usando BETWEEN
*/
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ListPrice BETWEEN 1.00 AND 10.00;

SELECT ProductName, ModifiedDate
FROM Production.Product
WHERE ModifiedDate BETWEEN '2012-01-01' AND '2012-12-31';

/*
filtrar por resultados que incluyan expresiones regulares
1.- que contenga la palabra mountain
2.- un caracter comodin 
3.- expresiones regulares complejas
*/
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE Name LIKE '%mountain%';

SELECT ProductName, ListPrice
FROM SalesLT.Product
WHERE ProductName LIKE 'Mountain Bike Socks, _';

SELECT ProductName, ListPrice
FROM SalesLT.Product
WHERE ProductName LIKE 'Mountain-[0-9][0-9][0-9] %, [0-9][0-9]';

