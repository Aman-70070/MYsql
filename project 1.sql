USE project_1

3. Perform the following with help of the above database:


a. Get all the details from the person table including email ID, phone
number and phone number type

SELECT p.*, pn.phone_number, pn.phone_number_type
FROM person p
JOIN phone_numbers pn ON p.person_id = pn.person_id;

b. Get the details of the sales header order made in May 2011

SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;

c. Get the details of the sales details order made in the month of May
2011

SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;


d. Get the total sales made in May 2011

SELECT SUM(Price) AS TotalSales
FROM Sales
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;



e. Get the total sales made in the year 2011 by month order by
increasing sales

SELECT YEAR(OrderDate) AS SalesYear, 
       MONTH(OrderDate) AS SalesMonth, 
       SUM(Price) AS TotalSales
FROM Sales
WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY TotalSales ASC;

f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'SELECT FORMAT(SUM(TotalDue), 'C') AS [Total Sales]
FROM Sales.SalesOrderHeader
JOIN Sales.Customer ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
WHERE Sales.Customer.FirstName = 'Gustavo'
AND Sales.Customer.LastName = 'Achong';
