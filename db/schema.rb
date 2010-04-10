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

ActiveRecord::Schema.define(:version => 20100410003221) do

  create_table "achievements", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "player1_hp"
    t.integer  "player2_hp"
    t.integer  "round_num"
    t.integer  "winner"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_weapons", :force => true do |t|
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "times_played", :default => 0
    t.integer  "weapon_id"
  end

  create_table "players", :force => true do |t|
    t.string   "player_name",                :null => false
    t.integer  "user_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wins",        :default => 0
    t.integer  "losses",      :default => 0
    t.integer  "draws",       :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token"
  end

  create_table "weapons", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.float    "base_attack"
    t.float    "base_defense"
    t.float    "mod_attack"
    t.float    "mod_defense"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "base_hp_regen"
    t.float    "mod_hp_regen"
    t.string   "image_url"
  end

end
