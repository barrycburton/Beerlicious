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

ActiveRecord::Schema.define(:version => 20090613164522) do

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.string   "info_url"
    t.decimal  "abv"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brewery_id"
  end

  create_table "breweries", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", :force => true do |t|
    t.decimal  "volume"
    t.decimal  "count"
    t.decimal  "price"
    t.integer  "beer_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "info_url"
    t.string   "address"
    t.string   "geo_loc"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
