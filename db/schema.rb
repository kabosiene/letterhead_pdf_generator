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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170421071043) do

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "client"
    t.text     "body_text"
    t.date     "file_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.integer  "pd_file_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pd_files", force: :cascade do |t|
    t.string   "file_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "file_date"
    t.string   "file_heading"
    t.string   "client_field"
    t.string   "client_name"
    t.text     "body_text"
    t.text     "footer"
    t.string   "side_text"
    t.text     "signature"
  end

end
