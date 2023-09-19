CREATE PROCEDURE IF NOT EXISTS GetMaxQuantity()
select MAX(Quantity) as "Max Quantity in Order" from Orders;