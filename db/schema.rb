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

ActiveRecord::Schema.define(:version => 20120718063645) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "micropost_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "extension"
  end

  add_index "comments", ["micropost_id"], :name => "index_comments_on_micropost_id"
  add_index "comments", ["project_id"], :name => "index_comments_on_project_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "floads", :force => true do |t|
    t.integer  "micropost_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "extension"
  end

  add_index "floads", ["micropost_id"], :name => "index_floads_on_micropost_id"
  add_index "floads", ["project_id"], :name => "index_floads_on_project_id"
  add_index "floads", ["user_id"], :name => "index_floads_on_user_id"

  create_table "invites", :force => true do |t|
    t.string   "name"
    t.string   "mail"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invites", ["project_id"], :name => "index_invites_on_project_id"
  add_index "invites", ["user_id"], :name => "index_invites_on_user_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "extension"
  end

  add_index "microposts", ["project_id"], :name => "index_microposts_on_project_id"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.string   "company_name"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "verify"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "extension"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "verify_token"
    t.datetime "verify_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
