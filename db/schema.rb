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

ActiveRecord::Schema.define(:version => 20110421134903) do

  create_table "articles", :force => true do |t|
    t.string   "title",                      :limit => 120
    t.text     "article"
    t.integer  "cord_x",                                    :default => 0
    t.integer  "cord_y",                                    :default => 0
    t.string   "article_photo_file_name"
    t.string   "article_photo_content_type"
    t.string   "article_photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "real",                                      :default => 0
    t.integer  "fake",                                      :default => 0
    t.string   "writer_name",                :limit => 20,  :default => "anonymous"
    t.integer  "read_count",                                :default => 0
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                       :default => 0
    t.string   "user_name",      :limit => 20,  :default => "anonymous"
    t.string   "user_photo_url",                :default => ""
    t.string   "comment",        :limit => 120, :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                    :limit => 20
    t.string   "email",                   :limit => 30
    t.string   "user_photo_file_name"
    t.string   "user_photo_content_type"
    t.integer  "user_photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password",                :limit => 20, :default => "0"
    t.string   "persistence_token"
  end

end
