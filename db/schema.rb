# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090908000831) do

  create_table "bookings", :force => true do |t|
    t.string   "name"
    t.integer  "vatsim_id"
    t.string   "email"
    t.integer  "flight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_downloads", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "download_id"
  end

  create_table "downloads", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "download_updated_at"
    t.integer  "category_id"
  end

  create_table "flights", :force => true do |t|
    t.string   "airline"
    t.string   "callsign"
    t.string   "dep"
    t.string   "arr"
    t.time     "dtime"
    t.time     "atime"
    t.string   "aircraft"
    t.boolean  "inbound"
    t.boolean  "outbound"
    t.boolean  "booked"
    t.text     "routing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "enroute_time"
  end

  create_table "pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "side_bar"
  end

  create_table "routes", :force => true do |t|
    t.string   "airline"
    t.string   "callsign"
    t.string   "dep"
    t.string   "arr"
    t.time     "dtime"
    t.time     "atime"
    t.string   "aircraft"
    t.integer  "inbound"
    t.integer  "outbound"
    t.integer  "booked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
