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

ActiveRecord::Schema.define(:version => 20140116182147) do

  create_table "app_deployments", :force => true do |t|
    t.string   "version"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "deployment_file_name"
    t.string   "deployment_content_type"
    t.integer  "deployment_file_size"
    t.datetime "deployment_updated_at"
    t.integer  "application_id"
  end

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "repository"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "script_file_name"
    t.string   "script_content_type"
    t.integer  "script_file_size"
    t.datetime "script_updated_at"
  end

  create_table "deployment_logs", :force => true do |t|
    t.datetime "date"
    t.integer  "app_deployment_id"
    t.integer  "environment_id"
    t.boolean  "successful"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "error_message"
  end

  create_table "environments", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "deployment_file_name"
    t.string   "deployment_content_type"
    t.integer  "deployment_file_size"
    t.datetime "deployment_updated_at"
    t.integer  "application_id"
  end

end
