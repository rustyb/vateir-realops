class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.string :name
      t.integer :vatsim_id
      t.string :email
      t.integer :flight_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :bookings
  end
end
