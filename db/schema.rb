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

ActiveRecord::Schema.define(version: 2015_02_04_123745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ambito_trabajos", id: :serial, force: :cascade do |t|
    t.string "name_es", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name_en", limit: 255
  end

  create_table "contribucions", id: :serial, force: :cascade do |t|
    t.integer "practica_id"
    t.integer "objetivo_id"
    t.integer "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["objetivo_id"], name: "index_contribucions_on_objetivo_id"
    t.index ["practica_id"], name: "index_contribucions_on_practica_id"
  end

  create_table "desafios", id: :serial, force: :cascade do |t|
    t.string "name_es", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name_en", limit: 255
  end

  create_table "objetivos", id: :serial, force: :cascade do |t|
    t.string "name_es", limit: 255
    t.boolean "sat_client"
    t.boolean "equipo"
    t.boolean "productivity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name_en", limit: 255
  end

  create_table "practica_desafios", id: :serial, force: :cascade do |t|
    t.integer "practica_id"
    t.integer "desafio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["desafio_id"], name: "index_practica_desafios_on_desafio_id"
    t.index ["practica_id"], name: "index_practica_desafios_on_practica_id"
  end

  create_table "practicas", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.string "name_es", limit: 255
    t.string "agile_method", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "effort"
    t.text "description_es"
    t.string "ambito_decision", limit: 255
    t.string "name_en", limit: 255
    t.string "description_en", limit: 255
  end

  create_table "relacion_practicas", id: :serial, force: :cascade do |t|
    t.integer "practica_id"
    t.integer "practica2_id"
    t.index ["practica2_id"], name: "index_relacion_practicas_on_practica2_id"
    t.index ["practica_id"], name: "index_relacion_practicas_on_practica_id"
  end

  create_table "sector_empresas", id: :serial, force: :cascade do |t|
    t.string "name_es", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name_en", limit: 255
  end

  create_table "user_objetivos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "objetivo_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "no_interesa", default: false
    t.text "comment"
    t.index ["objetivo_id"], name: "index_user_objetivos_on_objetivo_id"
    t.index ["user_id"], name: "index_user_objetivos_on_user_id"
  end

  create_table "user_practicas", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.string "name_es", limit: 255
    t.string "agile_method", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "practica_id"
    t.integer "legacy_position"
    t.text "comment"
    t.integer "effort"
    t.integer "range"
    t.boolean "no_aplicable", default: false
    t.string "name_en", limit: 255
    t.index ["practica_id"], name: "index_user_practicas_on_practica_id"
    t.index ["user_id"], name: "index_user_practicas_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "remember_token", limit: 255
    t.string "password_reset_token", limit: 255
    t.datetime "password_reset_sent_at"
    t.integer "ambito_trabajo_id"
    t.integer "sector_empresa_id"
    t.string "ip", limit: 255
    t.integer "miembros_equipo"
    t.index ["ambito_trabajo_id"], name: "index_users_on_ambito_trabajo_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["sector_empresa_id"], name: "index_users_on_sector_empresa_id"
  end

end
