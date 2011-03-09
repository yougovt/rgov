# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110309110440) do

  create_table "pages", :force => true do |t|
    t.string   "orgname"
    t.integer  "jurisdiction"
    t.string   "city"
    t.string   "state"
    t.text     "function"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_url"
    t.string   "leader"
    t.string   "leader_title"
    t.float    "budget"
    t.string   "budget_year"
    t.integer  "rtiscore"
    t.string   "rtiaddress"
    t.string   "permalink"
  end

  create_table "requests", :force => true do |t|
    t.integer  "page_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street1"
    t.string   "street2"
    t.integer  "pin"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.string   "email"
    t.integer  "type"
    t.string   "sub"
    t.text     "body"
    t.string   "serial_number"
    t.integer  "payment_amount"
    t.string   "payment_mode"
    t.string   "payment_serial_number"
    t.string   "payment_payable_at"
    t.boolean  "verified"
    t.boolean  "submitted"
    t.datetime "submitdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "external_link"
    t.string   "desc"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["page_id"], :name => "index_services_on_page_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",                     :default => false
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
    t.string   "email_verify_code"
    t.string   "email_verify_code_until"
    t.string   "permalink"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
