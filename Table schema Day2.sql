-- Creating Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    City NVARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ProductName NVARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting Data
INSERT INTO Customers (CustomerID, Name, Email, City) VALUES
(1, 'Alice', 'alice@example.com', 'New York'),
(2, 'Bob', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', 'Chicago'),
(4, 'David', 'david@example.com', 'Houston'),
(5, 'Emma', 'emma@example.com', 'Phoenix'),
(6, 'Frank', 'frank@example.com', 'San Diego'),
(7, 'Grace', 'grace@example.com', 'Dallas'),
(8, 'Hannah', 'hannah@example.com', 'San Jose'),
(9, 'Ian', 'ian@example.com', 'Austin'),
(10, 'Jack', 'jack@example.com', 'Seattle');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-02-10', 250.00),
(2, 2, '2024-02-11', 400.50),
(3, 3, '2024-02-12', 150.75),
(4, 4, '2024-02-13', 300.00),
(5, 5, '2024-02-14', 500.99),
(6, 6, '2024-02-15', 120.25),
(7, 7, '2024-02-16', 220.80),
(8, 8, '2024-02-17', 330.45),
(9, 9, '2024-02-18', 450.60),
(10, 10, '2024-02-19', 275.30);

INSERT INTO OrderDetails (DetailID, OrderID, ProductName, Quantity, Price) VALUES
(1, 1, 'Laptop', 1, 250.00),
(2, 2, 'Phone', 2, 200.25),
(3, 3, 'Tablet', 1, 150.75),
(4, 4, 'Monitor', 1, 300.00),
(5, 5, 'Headphones', 5, 100.20),
(6, 6, 'Keyboard', 2, 60.12),
(7, 7, 'Mouse', 3, 40.27),
(8, 8, 'Printer', 1, 330.45),
(9, 9, 'Speaker', 2, 225.30),
(10, 10, 'Webcam', 1, 275.30);
