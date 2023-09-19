delimiter //
create procedure CancelOrder (IN customer_id int)
begin
    delete from Orders where CustomerID=customer_id;
    select CONCAT("Order ", customer_id, " is cancelled") as Confirmation;
end
//
delimiter ;
