class BookingObserver < ActiveRecord::Observer
  def after_save(booking)
    if booking.flight.inbound?
      BookingMailer.deliver_new_arr_booking(booking)
    else
      BookingMailer.deliver_new_dep_booking(booking)
    end
    
  end
end
