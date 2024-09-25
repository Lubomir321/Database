-- Function 1: Calculate total order amount for a specific customer
DROP FUNCTION GetCustomerTotalOrderAmount;
CREATE FUNCTION GetCustomerTotalOrderAmount(cID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(TotalAmount) INTO total
    FROM `Order`
    WHERE CustomerID = cID;
    RETURN IFNULL(total, 0);
END;

-- Test for Function 1
SELECT GetCustomerTotalOrderAmount(1) AS TotalOrderAmountForCustomer1;
SELECT GetCustomerTotalOrderAmount(2) AS TotalOrderAmountForCustomer2;

-- Function 2: Returns product amount
CREATE FUNCTION ProductAmount(prodId INT)
RETURNS INT
DETERMINISTIC
RETURN
(SELECT StockQuantity
 FROM product
 WHERE ProductID = prodId);



-- Test for Function 2
SELECT ProductAmount(1) AS IsLaptopInStock;
SELECT ProductAmount(2) AS IsSmartphoneInStock;

-- Function 3: Get the number of pending payments for a customer
CREATE FUNCTION GetPendingPaymentsCount(custId INT)
RETURNS INT
DETERMINISTIC
RETURN
(
  SELECT COUNT(*)
  FROM Payment
  WHERE CustomerID = custID AND Status = 'pending'
);

-- Test for Function 3
SELECT GetPendingPaymentsCount(1) AS PendingPaymentsForCustomer1;
SELECT GetPendingPaymentsCount(2) AS PendingPaymentsForCustomer2;
