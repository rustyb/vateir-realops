class Booking < ActiveRecord::Base
  belongs_to :flight
  
  attr_accessible :name, :vatsim_id, :email, :flight_id

  validates_presence_of :name, :vatsim_id, :email, :flight_id
  validates_uniqueness_of :flight_id

  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message


  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def flight_from_eidw
    flight.arr == "EIDW"
  end


  def self.bookings_for_mailing(limit)
		return nil if ((limit > 20) || (limit < 1))
		find :all,
      :conditions => ['sent_at IS NULL'],
      :order => 'created_at ASC',
      :limit => limit
	end


  def self.resend_to_bookers(limit)
		if bookings = Booking.bookings_for_mailing(limit)
			bookings.each do |booking|
        booking.update_attribute(:sent_at, Time.now)
        if booking.flight.inbound?
          BookingMailer.deliver_new_arr_booking(booking)if booking.flight.inbound?
        else
          BookingMailer.deliver_new_dep_booking(booking)
        end
	  		#BookingMailer.deliver_new_arr_booking(booking)
			end
			return true
		end
	end
  
end
