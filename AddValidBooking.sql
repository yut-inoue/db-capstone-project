delimiter //
create procedure AddValidBooking (IN booking_date date, IN table_number int, IN customer_id int)
begin
    declare book_num int;
    declare booking_msg varchar(45);
    start transaction;
    set book_num = (select count(*) from Bookings where BookingDate = booking_date and TableNumber=table_number);
    insert into Bookings (TableNumber, BookingDate, CustomerID) values (table_number, booking_date, customer_id);
    if book_num > 0 then rollback;
    else commit;
    end if;

    if book_num > 0 then set booking_msg='is already booked - booking cancelled';
    else set booking_msg='is now booked - bookig made successfully';
    end if;
    
    select CONCAT("Table ", table_number, " ", booking_msg) as Confirmation;
end
//
delimiter ;