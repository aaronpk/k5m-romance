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

ActiveRecord::Schema.define(:version => 20120612184736) do

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "text"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "candidate_id"
    t.integer  "shareholder_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "shareholders", :force => true do |t|
    t.integer  "shares"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "vote_histories", :force => true do |t|
    t.integer  "value"
    t.text     "candidate_text"
    t.integer  "candidate_id"
    t.integer  "shareholder_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "candidate_id"
    t.integer  "shareholder_id"
  end

end
