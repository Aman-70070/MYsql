CREATE DATABASE ASS_1
USE ASS_1

CREATE TABLE Salesman(
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT)

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    ) 
	SELECT *FROM CUSTOMER
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money) 

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

Tasks to be Performed:

1. Insert a new record in your Orders table.

INSERT INTO ORDERS VALUES (5981,2452,188,'2024-08-26',546)

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.

ALTER TABLE SALESMAN
ALTER COLUMN SALESMANID INT NOT NULL

ALTER TABLE SALESMAN
ADD PRIMARY KEY (SALESMANID)

ALTER TABLE SALESMAN 
ADD CONSTRAINT DF_CITY DEFAULT 'KOWN' FOR CITY 

ALTER TABLE CUSTOMER
ALTER COLUMN CUSTOMERNAME VARCHAR(255) NOT NULL

ALTER TABLE CUSTOMER
ADD CONSTRAINT FK_SALESMANID FOREIGN KEY (SALESMANID) REFERENCES SALESMAN (SALESMANID)


3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.

SELECT * FROM Customer
WHERE CUSTOMERNAME LIKE '%N' 
AND PurchaseAmount > 500

4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId FROM customer
UNION
SELECT SalesmanId FROM orders

SELECT salesmanid FROM CUSTOMER
UNION ALL 
SELECT salesmanid FROM ORDERS

5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.

SELECT o.Orderdate, s.Salesmanid, c.CustomerNAME, s.Commission, s.City
FROM Orders o
JOIN Salesman s ON o.SalesmanID = s.Salesmanid
JOIN Customer c ON o.CustomerID = c.Customerid
WHERE c.PurchaseAmount BETWEEN 500 AND 1500

6. Using right join fetch all the results from Salesman and Orders table.

SELECT * FROM salesman 
RIGHT JOIN orders ON salesman.salesmanid=orders.salesmanid