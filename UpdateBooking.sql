delimiter //
create procedure UpdateBooking (IN booking_id int, IN booking_date date)
begin
	update Bookings set BookingDate = booking_date where BookingID=booking_id;
    select CONCAT("Booking ", booking_id, " updated") as Confirmation;
end
//
delimiter ;