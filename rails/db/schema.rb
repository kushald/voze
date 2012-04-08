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

ActiveRecord::Schema.define(:version => 20120408123448) do

  create_table "invites", :force => true do |t|
    t.string   "code",       :null => false
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invites", ["code"], :name => "index_invites_on_code", :unique => true
  add_index "invites", ["invitee_id"], :name => "index_invites_on_invitee_id", :unique => true
  add_index "invites", ["inviter_id"], :name => "index_invites_on_inviter_id"

  create_table "peers", :force => true do |t|
    t.integer  "torrent_id",              :null => false
    t.integer  "user_id",                 :null => false
    t.string   "peer_id",                 :null => false
    t.string   "ip",                      :null => false
    t.integer  "port",                    :null => false
    t.integer  "uploaded",   :limit => 8, :null => false
    t.integer  "downloaded", :limit => 8, :null => false
    t.integer  "left",       :limit => 8, :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "peers", ["left"], :name => "index_peers_on_left"
  add_index "peers", ["peer_id"], :name => "index_peers_on_peer_id"
  add_index "peers", ["torrent_id"], :name => "index_peers_on_torrent_id"

  create_table "torrents", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "user_id",    :null => false
    t.string   "info_hash",  :null => false
    t.text     "info_json",  :null => false
    t.text     "comment",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "torrents", ["info_hash"], :name => "index_torrents_on_info_hash", :unique => true
  add_index "torrents", ["user_id"], :name => "index_torrents_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "upload",               :limit => 8, :default => 0, :null => false
    t.integer  "download",             :limit => 8, :default => 0, :null => false
    t.string   "password_reset_token"
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], :name => "index_users_on_auth_token"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["password_reset_token"], :name => "index_users_on_password_reset_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_login", :unique => true

end
