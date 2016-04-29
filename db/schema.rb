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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160429001920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "admin",                  default: false
    t.string   "location"
    t.string   "phone_number"
    t.string   "tag",                    default: "online"
    t.integer  "requests_count"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "client_id"
    t.datetime "date_time"
    t.boolean  "resolved",                               default: false
    t.integer  "bedrooms",                               default: 0
    t.integer  "bathrooms",                              default: 0
    t.integer  "kitchens",                               default: 0
    t.integer  "hall",                                   default: 0
    t.string   "weekdays",                               default: [],                        array: true
    t.string   "extra_services",                         default: [],                        array: true
    t.string   "status",                                 default: "unresolved"
    t.string   "email"
    t.string   "phone_number"
    t.text     "location"
    t.decimal  "frequency",      precision: 6, scale: 2
  end

  add_index "requests", ["client_id"], name: "index_requests_on_client_id", using: :btree

  create_table "requests_workers", id: false, force: :cascade do |t|
    t.integer "request_id"
    t.integer "worker_id"
  end

  add_index "requests_workers", ["request_id"], name: "index_requests_workers_on_request_id", using: :btree
  add_index "requests_workers", ["worker_id"], name: "index_requests_workers_on_worker_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "client_id"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_client_id", using: :btree
  add_index "reviews", ["worker_id"], name: "index_reviews_on_worker_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.integer  "age"
    t.string   "phone_number"
    t.string   "education"
    t.string   "location"
    t.text     "experience"
    t.integer  "minimum_wage"
    t.string   "email"
    t.text     "extra_info"
    t.boolean  "assigned",     default: false
  end

  add_foreign_key "requests", "clients"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "workers"
end
