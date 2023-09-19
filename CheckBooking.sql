delimiter //
create procedure CheckBooking (IN booking_date date, IN table_number int)
begin
    declare book_num int;
    declare booking_msg varchar(45);
    set book_num = (select count(*) from Bookings where BookingDate = booking_date and TableNumber=table_number);
    if book_num=0 then set booking_msg='is not booked yet';
    else set booking_msg='is already booked';
    end if;
    select CONCAT("Table ", table_number, " ", booking_msg) as Confirmation;
end
//
delimiter ;