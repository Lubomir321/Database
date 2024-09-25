-- View 1: Customer Order Summary
CREATE VIEW CustomerOrderSummary AS
SELECT
    c.CustomerID,
    c.Name,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalAmountSpent
FROM
    Customer c
LEFT JOIN
    `Order` o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.Name;

-- View 2: Product Inventory Status
CREATE VIEW ProductInventoryStatus AS
SELECT
    p.ProductID,
    p.Name,
    p.StockQuantity,
    CASE
        WHEN p.StockQuantity > 0 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS StockStatus
FROM
    Product p;

-- View 3: Pending Payments Summary
CREATE VIEW PendingPaymentsSummary AS
SELECT
    c.CustomerID,
    c.Name,
    COUNT(p.PaymentID) AS PendingPaymentsCount,
    SUM(p.Amount) AS TotalPendingAmount
FROM
    Customer c
LEFT JOIN
    Payment p ON c.CustomerID = p.CustomerID
WHERE
    p.Status = 'pending'
GROUP BY
    c.CustomerID, c.Name;

-- Tests for the views
-- Test for View 1
SELECT * FROM CustomerOrderSummary;

-- Test for View 2
SELECT * FROM ProductInventoryStatus;

-- Test for View 3
SELECT * FROM PendingPaymentsSummary;
