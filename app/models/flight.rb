class Flight < ActiveRecord::Base
  has_one :booking
  
  attr_accessible :airline, :callsign, :dep, :arr, :dtime, :atime, :aircraft, :inbound, :outbound, :booked, :routing

  validates_presence_of :airline, :callsign, :dep, :arr, :dtime, :atime, :aircraft, :routing
  validates_uniqueness_of :callsign

  validates_presence_of :inbound, :unless => :outbound

  validates_length_of :dep, :arr, :is => 4
  validates_length_of :callsign, :minimum => 3
  validates_length_of :airline, :is => 3



  def route=(value)
    write_attribute :route, (value ? value.upcase : nil)
  end

  
end
