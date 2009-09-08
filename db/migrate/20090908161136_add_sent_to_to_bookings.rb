class AddSentToToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :sent_at, :datetime
  end

  def self.down
    add_column :bookings, :sent_at
  end
end
