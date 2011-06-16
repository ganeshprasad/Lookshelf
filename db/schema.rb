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

ActiveRecord::Schema.define(:version => 20110616100823) do

  create_table "lenders", :force => true do |t|
    t.integer  "lender_id"
    t.integer  "borrower_id"
    t.string   "status"
    t.integer  "tag_id"
    t.date     "date_of_request"
    t.date     "estimated_delivery"
    t.date     "return_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "subject"
    t.string   "author"
    t.string   "title"
    t.string   "topic"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "y"
    t.integer  "width"
    t.integer  "height"
    t.integer  "x"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "identifier",                 :default => "", :null => false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shelf_name"
    t.string   "shelf_location"
    t.string   "full_name"
    t.string   "phone"
    t.string   "shipping_address"
    t.string   "city"
    t.string   "zip"
    t.boolean  "lookshelf_notification"
    t.boolean  "news_feed"
    t.boolean  "event_notification"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.string   "shelf_image_file_name"
    t.string   "shelf_image_content_type"
    t.integer  "shelf_image_file_size"
  end

  add_index "users", ["identifier"], :name => "index_users_on_identifier", :unique => true

end
