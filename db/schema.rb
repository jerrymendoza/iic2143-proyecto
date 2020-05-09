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

ActiveRecord::Schema.define(version: 2020_05_08_224527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


# https://medium.com/@anaharris/how-to-add-image-upload-functionality-to-your-rails-app-9f7fc3f3d042
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "rut"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "matcher"
    t.string "local"
    t.integer "valoracion"
    t.text "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comunas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gustos", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
  end

  create_table "likes", force: :cascade do |t|
    t.string "matcher_1"
    t.string "matcher_2"
    t.boolean "match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locals", force: :cascade do |t|
    t.string "nombre"
    t.string "dueno"
    t.string "comuna"
    t.text "descripcion"
    t.boolean "aceptado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "rut"
    t.string "nombre"
    t.integer "telefono"
    t.integer "edad"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_matchers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_matchers_on_reset_password_token", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.string "local"
    t.integer "like"
    t.date "fecha"
    t.time "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propietario_locals", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "rut"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_propietario_locals_on_email", unique: true
    t.index ["reset_password_token"], name: "index_propietario_locals_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
