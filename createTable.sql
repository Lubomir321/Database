CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL CHECK (Email LIKE '%@%.%'),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    Description TEXT,
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0)
);

CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0),
    Status VARCHAR(50) NOT NULL CHECK (Status IN ('pending', 'shipped', 'delivered', 'canceled')),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderItem (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PaymentDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL CHECK (Status IN ('successful', 'pending', 'failed')),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


