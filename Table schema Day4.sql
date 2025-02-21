-- 1. Customers Table
CREATE TABLE Customers_bakery (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) NULL
);


INSERT INTO Customers_bakery (Name, Email, Phone) VALUES
('John Doe', 'john@example.com', '9876543210'),
('Jane Smith', 'jane@example.com', '9123456789'),
('Alice Brown', 'alice@example.com', NULL),
('Bob White', 'bob@example.com', '9876543210'), -- Duplicate phone
('Eve Green', 'test@gmail.com', '8765432109'), -- Null email
('John Doe', 'joh1n@example.com', '9876543210'), -- Duplicate customer
('Tom Blue', 'tom@example.com', '7654321098'),
('Nick Red', 'nick@example.com', NULL),
('Mia Yellow', NULL, '6543210987'),
('Sophia Black', 'sophia@example.com', '5432109876');

-- 2. Products Table
CREATE TABLE Products_bakery (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(50)
);

INSERT INTO Products_bakery (Name, Price, Category) VALUES
('Sourdough Bread', 5.50, 'Bread'),
('Baguette', 4.00, 'Bread'),
('Croissant', 3.75, 'Pastry'),
('Chocolate Cake', 15.00, 'Cake'),
('Muffin', 2.50, 'Pastry'),
('Brownie', 3.00, 'Dessert'),
('Chocolate Cake', 15.00, 'Cake'), -- Duplicate
('Donut', 1.50, 'Dessert'),
('Cheesecake', 20.00, 'Cake'),
('Cinnamon Roll', 2.75, 'Pastry');

-- 3. Orders Table
CREATE TABLE Orders_bakery (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers_bakery(CustomerID)
);

INSERT INTO Orders_bakery (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-02-20', 25.50),
(2, '2025-02-21', 30.00),
(3, '2025-02-22', 45.75),
(4, '2025-02-23', 15.00),
(5, '2025-02-24', 10.50),
(1, '2025-02-25', 12.00), -- Same customer ordering again
(6, '2025-02-26', 22.50),
(7, '2025-02-27', 50), -- Null total amount
(8, '2025-02-28', 19.99),
(9, '2025-02-9', 5.00);

-- 4. OrderDetails Table
CREATE TABLE OrderDetails_bakery (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders_bakery(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products_bakery(ProductID)
);

INSERT INTO OrderDetails_bakery (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 5.50),
(1, 3, 1, 3.75),
(2, 2, 3, 4.00),
(2, 5, 2, 2.50),
(3, 4, 1, 15.00),
(3, 6, 2, 3.00),
(4, 1, 1, 5.50),
(5, 7, 1, 15.00), -- Duplicate product
(6, 8, 4, 1.50),
(7, 9, 1, 5); -- Null price
