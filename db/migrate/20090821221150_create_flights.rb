class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.string :airline
      t.string :callsign
      t.string :dep
      t.string :arr
      t.time :dtime
      t.time :atime
      t.string :aircraft
      t.boolean :inbound
      t.boolean :outbound
      t.boolean :booked
      t.text :routing
      t.string :flight_level
      t.timestamps
    end
  end
  
  def self.down
    drop_table :flights
  end
end
