
-- Trigger 1: Enforce Positive Stock Quantity
-- SQLSTATE exceptions
CREATE TRIGGER EnforcePositiveStockQuantity
BEFORE UPDATE ON Product
FOR EACH ROW
BEGIN
    IF NEW.StockQuantity < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
    END IF;
END;

-- Trigger 2: Update Product Stock Quantity After OrderItem Insertion
CREATE TRIGGER UpdateProductStockAfterOrderItemInsert
AFTER INSERT ON OrderItem
FOR EACH ROW
BEGIN
    UPDATE Product
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END;

-- Test for Trigger 1
UPDATE Product
SET StockQuantity = -10
WHERE ProductID = 1;

-- Test for Trigger 2
INSERT INTO OrderItem (OrderID, ProductID, Quantity, Price)
VALUES (1, 2, 5, 599.99);

SELECT StockQuantity FROM Product WHERE ProductID = 2;
