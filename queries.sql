-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName,
        CategoryName
    FROM Product
        JOIN
        Category ON Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id AS OrderID,
        S.CompanyName AS Shipper
    FROM [Order] AS O
        JOIN
        Shipper AS S ON O.ShipVia = S.Id
    WHERE OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT ProductName,
        Quantity
    FROM OrderDetail
        JOIN
        Product ON Product.Id = ProductId
    WHERE OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id AS OrderID,
        CompanyName AS Company,
        LastName AS [Employee Last Name]
    FROM [Order] AS O
        JOIN
        Customer AS C,
        Employee AS E 
            ON C.Id = O.CustomerId 
            AND E.Id = O.EmployeeId;


-- STRETCH QUERIES - SQL Try Editor at W3Schools.com

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT CategoryName,
        COUNT(Products.ProductID) 
FROM Categories
    JOIN
    Products ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;


-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID,
        SUM(Quantity) AS ItemCount
FROM OrderDetails
GROUP BY OrderID;