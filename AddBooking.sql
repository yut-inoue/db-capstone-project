delimiter //
create procedure AddBooking (IN booking_id int, IN customer_id int, IN booking_date date, IN table_number int)
begin
    declare book_num int;
    declare booking_msg varchar(45);
    start transaction;
    set book_num = (select count(*) from Bookings where BookingDate = booking_date and TableNumber=table_number);
    insert into Bookings values (booking_id, table_number, booking_date, customer_id);
    if book_num > 0 then rollback;
    else commit;
    end if;

    if book_num > 0 then set booking_msg='booking cancelled';
    else set booking_msg='New booking added';
    end if;

    select booking_msg as Confirmation;
end
//
delimiter ;