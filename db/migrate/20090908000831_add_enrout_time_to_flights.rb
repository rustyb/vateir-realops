class AddEnroutTimeToFlights < ActiveRecord::Migration
  def self.up
    add_column :flights, :enroute_time, :time
  end

  def self.down
    remove_column :flights, :enroute_time
  end
end
