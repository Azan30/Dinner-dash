# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_201_014_132_914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cart_items', force: :cascade do |t|
    t.bigint 'cart_id'
    t.bigint 'item_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'quantity'
    t.index ['cart_id'], name: 'index_cart_items_on_cart_id'
    t.index ['item_id'], name: 'index_cart_items_on_item_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_carts_on_user_id', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'item_categories', force: :cascade do |t|
    t.bigint 'item_id'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_item_categories_on_category_id'
    t.index ['item_id'], name: 'index_item_categories_on_item_id'
  end

  create_table 'items', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description', null: false
    t.decimal 'price', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'line_items', force: :cascade do |t|
    t.bigint 'order_id'
    t.bigint 'item_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'cart_id'
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
    t.index ['item_id'], name: 'index_line_items_on_item_id'
    t.index ['order_id'], name: 'index_line_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'status', default: 0, null: false
    t.decimal 'bill', precision: 8, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'full_name', null: false
    t.string 'display_name', limit: 32
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'type'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'welcomes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'carts', 'users'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'orders', 'users'
end
