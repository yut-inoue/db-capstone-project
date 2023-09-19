delimiter //
create procedure CancelBooking (IN booking_id int)
begin
    delete from Bookings where BookingID = booking_id;
end
//
delimiter ;