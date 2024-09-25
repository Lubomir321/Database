-- Insert Customers
INSERT INTO Customer (Name, Email, Address, Phone) VALUES
('John Doe', 'john.doe@example.com', '123 Elm Street', '555-1234'),
('Jane Smith', 'jane.smith@example.com', '456 Oak Street', '555-5678'),
('Alice Johnson', 'alice.johnson@example.com', '789 Pine Street', '555-8765'),
('Bob Brown', 'bob.brown@example.com', '101 Maple Street', '555-4321'),
('Charlie Davis', 'charlie.davis@example.com', '202 Birch Street', '555-3456'),
('Diana Evans', 'diana.evans@example.com', '303 Cedar Street', '555-6543'),
('Frank Green', 'frank.green@example.com', '404 Walnut Street', '555-7890'),
('Grace Harris', 'grace.harris@example.com', '505 Ash Street', '555-0987'),
('Henry Lee', 'henry.lee@example.com', '606 Willow Street', '555-2345'),
('Ivy Kim', 'ivy.kim@example.com', '707 Redwood Street', '555-6789');

-- Insert Products
INSERT INTO Product (Name, Price, Description, StockQuantity) VALUES
('Laptop', 999.99, 'High performance laptop', 50),
('Smartphone', 599.99, 'Latest model smartphone', 100),
('Headphones', 199.99, 'Noise-cancelling headphones', 200),
('Monitor', 299.99, '27 inch 4K monitor', 75),
('Keyboard', 49.99, 'Mechanical keyboard', 150),
('Mouse', 29.99, 'Wireless mouse', 300),
('Printer', 149.99, 'All-in-one printer', 80),
('Webcam', 89.99, 'HD webcam', 120),
('Tablet', 399.99, '10 inch tablet', 60),
('Smartwatch', 199.99, 'Fitness tracker smartwatch', 0);

-- Insert Orders
INSERT INTO `Order` (OrderDate, TotalAmount, Status, CustomerID) VALUES
('2024-05-01 10:00:00', 1249.98, 'shipped', 1),
('2024-05-02 11:00:00', 599.99, 'pending', 2),
('2024-05-03 12:00:00', 379.98, 'shipped', 3),
('2024-05-04 13:00:00', 199.99, 'shipped', 4),
('2024-05-05 14:00:00', 299.99, 'shipped', 5),
('2024-05-06 15:00:00', 79.98, 'shipped', 6),
('2024-05-07 16:00:00', 149.99, 'pending', 7),
('2024-05-08 17:00:00', 689.97, 'shipped', 8),
('2024-05-09 18:00:00', 399.99, 'pending', 9),
('2024-05-10 19:00:00', 1249.98, 'shipped', 10);

-- Insert Payments
INSERT INTO Payment (Amount, PaymentDate, Status, CustomerID) VALUES
(1249.98, '2024-05-01 10:30:00', 'successful', 1),
(599.99, '2024-05-02 11:30:00', 'pending', 2),
(379.98, '2024-05-03 12:30:00', 'successful', 3),
(199.99, '2024-05-04 13:30:00', 'successful', 4),
(299.99, '2024-05-05 14:30:00', 'successful', 5),
(79.98, '2024-05-06 15:30:00', 'successful', 6),
(149.99, '2024-05-07 16:30:00', 'pending', 7),
(689.97, '2024-05-08 17:30:00', 'successful', 8),
(399.99, '2024-05-09 18:30:00', 'pending', 9),
(1249.98, '2024-05-10 19:30:00', 'successful', 10);

-- Insert OrderItems
INSERT INTO OrderItem (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 999.99),
(1, 3, 1, 249.99),
(2, 2, 1, 599.99),
(3, 4, 1, 299.99),
(3, 6, 1, 79.99),
(4, 3, 1, 199.99),
(5, 4, 1, 299.99),
(6, 5, 1, 49.99),
(6, 6, 1, 29.99),
(7, 7, 1, 149.99),
(8, 8, 1, 89.99),
(8, 9, 1, 399.99),
(8, 10, 1, 199.99),
(9, 9, 1, 399.99),
(10, 1, 1, 999.99),
(10, 2, 1, 249.99);
