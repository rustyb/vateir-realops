class BookingMailer < ActionMailer::Base
  

  def new_dep_booking(booking, sent_at = Time.now)
    subject     "Dublin Realops Flight Booking Info for #{booking.flight.callsign}: #{booking.flight.dep} - #{booking.flight.arr}"
    recipients  booking.email
    from        'realops@vateir.com'
    sent_on     sent_at
    
    body       :booking => booking
  end


  def new_arr_booking(booking, sent_at = Time.now)
    subject     "Dublin Realops Flight Booking Info for #{booking.flight.callsign}: #{booking.flight.dep} - #{booking.flight.arr}"
    recipients  booking.email
    from        'realops@vateir.com'
    sent_on     sent_at

    body       :booking => booking
  end
end
