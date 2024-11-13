# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_13_174751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipamentos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.string "nome"
    t.string "marca"
    t.string "modelo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_equipamentos_on_cliente_id"
  end

  create_table "historicos", force: :cascade do |t|
    t.bigint "ordem_servico_id", null: false
    t.text "tipo_serivco"
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ordem_servico_id"], name: "index_historicos_on_ordem_servico_id"
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.bigint "equipamento_id", null: false
    t.string "descricao"
    t.string "status"
    t.date "data_abertura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_ordem_servicos_on_equipamento_id"
  end

  add_foreign_key "equipamentos", "clientes"
  add_foreign_key "historicos", "ordem_servicos"
  add_foreign_key "ordem_servicos", "equipamentos"
end
