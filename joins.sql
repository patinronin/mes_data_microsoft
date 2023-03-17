/*
el INNER JOIN es el default
no es necesario especificarlo
se usa para devolver solo los renglones 
que coincidan con el filtro deseado
1.- INNER JOIN de dos tablas 
2.- INNER JOIN de 3 tablas 
*/
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp 
INNER JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;

SELECT od.SalesOrderID, m.Name AS Model, p.Name AS ProductName, od.OrderQty
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS m
    ON p.ProductModelID = m.ProductModelID
INNER JOIN Sales.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
ORDER BY od.SalesOrderID;

/*
un ejemplo mas complicado de JOINS
*/
SELECT  c.CompanyName,
a.AddressLine1,
ISNULL(a.AddressLine2, '') AS AddressLine2,
a.City,
a.StateProvince,
a.PostalCode,
a.CountryRegion,
oh.SalesOrderID,
oh.TotalDue
FROM  SalesLT.Customer as c
JOIN SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
JOIN SalesLT.CustomerAddress as ca 
ON c.CustomerID = ca.CustomerID 
JOIN SalesLT.Address as a 
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office';

/*
OUTER JOIN regresa los renglones incluso sino
hubo la coincidencia del filtro pero lo regresa con 
valores NULL
puede usarse con LEFT, RIGHT, or FULL 
para seleccionar los datos de la tabla
deseada 
*/
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp
LEFT JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;

/*
CROSS JOIN se usa para crear 
todas las combinaciones posibles entre las 
dos tablas 
*/
SELECT emp.FirstName, prd.Name
FROM HR.Employee AS emp
CROSS JOIN Production.Product AS prd;

/*
SELF JOINS
se usa para comparar dos valores en la misma tabla
para ello tenemos que hacer un OUTER JOIN 
con la misma tabla pero usando alias distintos para los 
valores de interes 
en este caso queremos crear una tabla virtual
con  el manager de cada empleado, que el manager tambien es 
un empleado, el gerente es el unico que no tiene manager 
y tendria el ManagerId en NULL

*/
SELECT emp.FirstName AS Employee, 
       mgr.FirstName AS Manager
FROM HR.Employee AS emp
LEFT OUTER JOIN HR.Employee AS mgr
  ON emp.ManagerID = mgr.EmployeeID;