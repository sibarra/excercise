# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130603015906) do

  create_table "categories", :force => true do |t|
    t.string  "name",                         :null => false
    t.boolean "exclusive", :default => false, :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "description"
    t.string   "notes"
    t.float    "price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "user_id"
  end

  create_table "subcategories", :force => true do |t|
    t.string  "name",                       :null => false
    t.integer "category_id",                :null => false
    t.integer "order",       :default => 1
  end

  create_table "users", :force => true do |t|
    t.string  "first_name",                   :null => false
    t.string  "last_name",                    :null => false
    t.string  "email",                        :null => false
    t.string  "dob"
    t.string  "password",                     :null => false
    t.integer "role",          :default => 1
    t.text    "password_salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
