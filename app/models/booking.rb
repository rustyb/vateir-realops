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

  
end
