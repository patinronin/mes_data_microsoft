/*
puedes ordenar las columnas de forma ascendente o descendente
usando ORDER BY
*/
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
ORDER BY Category ASC, Price DESC;

/*
puedes limitar el numero de registros que te devuelve una consulta 
usando TOP pero esto es solo en T-SQL
*/
SELECT TOP 10 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

/*
puedes usar el PERCENT junto con TOP para regresar ese 
porcentaje de las consultas
PERCENT solo se puede usar en T-SQL
*/
SELECT TOP 10 PERCENT Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;


/*
paginacion 
puedes usar OFFSET N ROWS para seleccionar un offset 
puedes usar el FETCH NEXT N ROWS ONLY para regresar los siguientes N renglones
*/

SELECT ProductID, ProductName, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC 
OFFSET 0 ROWS --Skip zero rows
FETCH NEXT 10 ROWS ONLY; --Get the next 10
