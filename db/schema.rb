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

ActiveRecord::Schema.define(version: 20150204123745) do

  create_table "ambito_trabajos", force: true do |t|
    t.string   "name_es"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  create_table "contribucions", force: true do |t|
    t.integer  "practica_id"
    t.integer  "objetivo_id"
    t.integer  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contribucions", ["objetivo_id"], name: "index_contribucions_on_objetivo_id"
  add_index "contribucions", ["practica_id"], name: "index_contribucions_on_practica_id"

  create_table "desafios", force: true do |t|
    t.string   "name_es"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  create_table "objetivos", force: true do |t|
    t.string   "name_es"
    t.boolean  "sat_client"
    t.boolean  "equipo"
    t.boolean  "productivity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  create_table "practica_desafios", force: true do |t|
    t.integer  "practica_id"
    t.integer  "desafio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "practica_desafios", ["desafio_id"], name: "index_practica_desafios_on_desafio_id"
  add_index "practica_desafios", ["practica_id"], name: "index_practica_desafios_on_practica_id"

  create_table "practicas", force: true do |t|
    t.integer  "position"
    t.string   "name_es"
    t.string   "agile_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "effort"
    t.text     "description_es"
    t.string   "ambito_decision"
    t.string   "name_en"
    t.string   "description_en"
  end

  create_table "relacion_practicas", force: true do |t|
    t.integer "practica_id"
    t.integer "practica2_id"
  end

  add_index "relacion_practicas", ["practica2_id"], name: "index_relacion_practicas_on_practica2_id"
  add_index "relacion_practicas", ["practica_id"], name: "index_relacion_practicas_on_practica_id"

  create_table "sector_empresas", force: true do |t|
    t.string   "name_es"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  create_table "user_objetivos", force: true do |t|
    t.integer  "user_id"
    t.integer  "objetivo_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "no_interesa", default: false
    t.text     "comment"
  end

  add_index "user_objetivos", ["objetivo_id"], name: "index_user_objetivos_on_objetivo_id"
  add_index "user_objetivos", ["user_id"], name: "index_user_objetivos_on_user_id"

  create_table "user_practicas", force: true do |t|
    t.integer  "position"
    t.string   "name_es"
    t.string   "agile_method"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "practica_id"
    t.integer  "legacy_position"
    t.text     "comment"
    t.integer  "effort"
    t.integer  "range"
    t.boolean  "no_aplicable",    default: false
    t.string   "name_en"
  end

  add_index "user_practicas", ["practica_id"], name: "index_user_practicas_on_practica_id"
  add_index "user_practicas", ["user_id"], name: "index_user_practicas_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "ambito_trabajo_id"
    t.integer  "sector_empresa_id"
    t.string   "ip"
    t.integer  "miembros_equipo"
  end

  add_index "users", ["ambito_trabajo_id"], name: "index_users_on_ambito_trabajo_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["sector_empresa_id"], name: "index_users_on_sector_empresa_id"

end
