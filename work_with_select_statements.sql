/*
usando la base de datos 
*/

/*
puedes usar AS para darle un alias a una columna 
y puedes hacer sumas o restas si los datos son compatibles
*/
SELECT Name AS ProductName, ListPrice - StandardCost AS Markup
FROM SalesLT.Product;

/*
puedes sumar variables de texto usando comillas simples
*/
SELECT ProductNumber, Color, Size, Color + ', ' + Size AS ProductDetails
FROM SalesLT.Product;

/*
puedes usar CAST para convertir un tipo de dato a otro 
*/
SELECT CAST(ProductID AS varchar(5)) + ': ' + Name AS ProductName
FROM SalesLT.Product; 

/*
puedes usar TRY_CAST para devolver NULL si la conversion fallo
*/
SELECT Name, TRY_CAST(Size AS Integer) AS NumericSize
FROM SalesLT.Product; 

/*
puedes usar convert en lugar de CAST 
CONVERT esta solo disponible en SQL server 
mientas que CAST esta disponible en cualquier SQL
*/
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductName
FROM SalesLT.Product;

/*
CONVERT puede usarse con un parametro extra para 
cambiar de formato fechas 
*/
SELECT SellStartDate,
   CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
   CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate
FROM SalesLT.Product; 

/*
puedes usar ISNULL para regresar un valor por default si el valor es NULL
es parte de SQL server
*/
SELECT Name, ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSize
FROM SalesLT.Product;

/*
COALESCE sirve para retornar el valor que no sea NULL
si todos son NULL returna NULL
en el ejemplo solo 1 de los valores no sera NULL 
tambien puede ser usado como ISNULL si solo recive dos argumentos
*/
SELECT EmployeeID,
      COALESCE(HourlyRate * 40,
                WeeklySalary,
                Commission * SalesQty) AS WeeklyEarnings
FROM HR.Wages;

/*
con NULLIF puedes regresar NULL si el valor es igual al parametro enviado
*/
SELECT SalesOrderID,
      ProductID,
      UnitPrice,
      NULLIF(UnitPriceDiscount, 0) AS Discount
FROM Sales.SalesOrderDetail;