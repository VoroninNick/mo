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

ActiveRecord::Schema.define(version: 20140929150707) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "parent_id"
    t.string   "category_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id",  null: false
    t.string   "locale",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "category_url"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "d_categories", force: true do |t|
    t.string   "name"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "parent_id"
    t.string   "t_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_category_translations", force: true do |t|
    t.integer  "d_category_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "t_name"
  end

  add_index "d_category_translations", ["d_category_id"], name: "index_d_category_translations_on_d_category_id"
  add_index "d_category_translations", ["locale"], name: "index_d_category_translations_on_locale"

  create_table "decor_translations", force: true do |t|
    t.integer  "decor_id",          null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "t_name"
    t.text     "short_description"
    t.text     "description"
  end

  add_index "decor_translations", ["decor_id"], name: "index_decor_translations_on_decor_id"
  add_index "decor_translations", ["locale"], name: "index_decor_translations_on_locale"

  create_table "decors", force: true do |t|
    t.string   "name"
    t.string   "t_name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "count_items"
    t.float    "price"
    t.float    "new_price"
    t.text     "short_description"
    t.text     "description"
    t.integer  "d_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decor_id"
    t.integer  "product_set_id"
    t.integer  "product_pack_id"
  end

  create_table "drink_set_translations", force: true do |t|
    t.integer  "drink_set_id",      null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "t_name"
    t.text     "short_description"
    t.text     "description"
  end

  add_index "drink_set_translations", ["drink_set_id"], name: "index_drink_set_translations_on_drink_set_id"
  add_index "drink_set_translations", ["locale"], name: "index_drink_set_translations_on_locale"

  create_table "drink_sets", force: true do |t|
    t.string   "name"
    t.string   "t_name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "count_items"
    t.float    "price"
    t.float    "new_price"
    t.text     "short_description"
    t.text     "description"
    t.integer  "ds_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "drink_set_id"
    t.integer  "product_set_id"
    t.integer  "product_pack_id"
  end

  create_table "ds_categories", force: true do |t|
    t.string   "name"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "parent_id"
    t.string   "t_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ds_category_translations", force: true do |t|
    t.integer  "ds_category_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "t_name"
  end

  add_index "ds_category_translations", ["ds_category_id"], name: "index_ds_category_translations_on_ds_category_id"
  add_index "ds_category_translations", ["locale"], name: "index_ds_category_translations_on_locale"

  create_table "pasha_files", force: true do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "pasha_folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasha_folder_translations", force: true do |t|
    t.integer  "pasha_folder_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "content"
  end

  add_index "pasha_folder_translations", ["locale"], name: "index_pasha_folder_translations_on_locale"
  add_index "pasha_folder_translations", ["pasha_folder_id"], name: "index_pasha_folder_translations_on_pasha_folder_id"

  create_table "pasha_folders", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_galleries", force: true do |t|
    t.string   "title"
    t.string   "alt"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_gallery_translations", force: true do |t|
    t.integer  "photo_gallery_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "alt"
  end

  add_index "photo_gallery_translations", ["locale"], name: "index_photo_gallery_translations_on_locale"
  add_index "photo_gallery_translations", ["photo_gallery_id"], name: "index_photo_gallery_translations_on_photo_gallery_id"

  create_table "product_pack_translations", force: true do |t|
    t.integer  "product_pack_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

  add_index "product_pack_translations", ["locale"], name: "index_product_pack_translations_on_locale"
  add_index "product_pack_translations", ["product_pack_id"], name: "index_product_pack_translations_on_product_pack_id"

  create_table "product_packs", force: true do |t|
    t.string   "name"
    t.integer  "percent"
    t.string   "slug"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_properties", force: true do |t|
    t.string   "pp_key"
    t.string   "pp_value"
    t.boolean  "is_active_property"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "characteristic_id"
    t.string   "characteristic_type"
  end

  create_table "product_property_translations", force: true do |t|
    t.integer  "product_property_id", null: false
    t.string   "locale",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pp_key"
    t.string   "pp_value"
  end

  add_index "product_property_translations", ["locale"], name: "index_product_property_translations_on_locale"
  add_index "product_property_translations", ["product_property_id"], name: "index_product_property_translations_on_product_property_id"

  create_table "product_set_translations", force: true do |t|
    t.integer  "product_set_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "product_set_translations", ["locale"], name: "index_product_set_translations_on_locale"
  add_index "product_set_translations", ["product_set_id"], name: "index_product_set_translations_on_product_set_id"

  create_table "product_sets", force: true do |t|
    t.string   "name"
    t.integer  "percent"
    t.boolean  "is_active_set"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_translations", force: true do |t|
    t.integer  "product_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.string   "t_name"
  end

  add_index "product_translations", ["locale"], name: "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "price"
    t.integer  "count_items"
    t.text     "short_description"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "promotion_price"
    t.integer  "promotion_id"
    t.string   "t_name"
    t.integer  "product_set_id"
    t.integer  "product_pack_id"
  end

  create_table "promotion_translations", force: true do |t|
    t.integer  "promotion_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "promotion_translations", ["locale"], name: "index_promotion_translations_on_locale"
  add_index "promotion_translations", ["promotion_id"], name: "index_promotion_translations_on_promotion_id"

  create_table "promotions", force: true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "t_title"
    t.boolean  "selected_promotion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_translations", force: true do |t|
    t.integer  "publication_id",    null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "author"
    t.text     "short_description"
    t.text     "description"
  end

  add_index "publication_translations", ["locale"], name: "index_publication_translations_on_locale"
  add_index "publication_translations", ["publication_id"], name: "index_publication_translations_on_publication_id"

  create_table "publications", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "short_description"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "selected_article"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
