# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_07_012111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignaturas", force: :cascade do |t|
    t.string "asign_nombre"
    t.integer "asign_code"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.string "asign_coordinadores"
  end

  create_table "cursos", force: :cascade do |t|
    t.integer "curso_agno"
    t.integer "curso_sem"
    t.string "curso_coord"
    t.integer "curso_secc"
    t.integer "curso_elect"
    t.string "curso_profesores"
    t.integer "curso_aprobados"
    t.integer "curso_reprobados"
    t.integer "curso_promedio"
    t.integer "curso_inscritos"
    t.integer "curso_cod"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.bigint "asignatura_id"
  end

  create_table "cursos_profesors", id: :bigint, default: -> { "nextval('asignaturas_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "curso_id", default: -> { "nextval('curso_profesors_id_seq'::regclass)" }, null: false
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.bigint "profesor_id", null: false
  end

  create_table "pregunta", id: :bigint, default: -> { "nextval('resultado_encuesta_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "preg_nropreg"
    t.string "preg_pregunta"
    t.integer "preg_min"
    t.integer "preg_max"
    t.decimal "preg_prom"
    t.string "preg_profs"
    t.integer "preg_codsign"
    t.bigint "resultado_encuestum_id"
    t.string "preg_nombreasign"
    t.time "created_at", precision: 6, default: -> { "now()" }, null: false
    t.time "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.integer "preg_secc"
    t.string "preg_coord"
    t.integer "preg_agno"
    t.integer "preg_sem"
  end

  create_table "profesors", force: :cascade do |t|
    t.string "prof_nombre_corto"
    t.boolean "if_DUU"
    t.string "prof_e_mail"
    t.string "prof_depto"
    t.string "prof_area"
    t.string "prof_jornada"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.integer "if_pendiente"
    t.decimal "prof_proms_results"
    t.integer "prof_proms_d1"
    t.integer "prof_proms_d2"
    t.integer "prof_proms_d3"
    t.integer "prof_proms_d4"
    t.integer "prof_totalEncuestas"
    t.string "prof_observaciones"
    t.string "prof_photo"
  end

  create_table "profesors_resultado_encuesta", id: :bigint, default: -> { "nextval('asignaturas_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "resultado_encuestum_id"
    t.bigint "profesor_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.time "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "resultado_encuesta", force: :cascade do |t|
    t.integer "result_semestre"
    t.integer "result_agno"
    t.integer "result_asign"
    t.string "result_nombre"
    t.integer "result_total"
    t.integer "result_promming1"
    t.integer "result_promming2"
    t.integer "result_promming3"
    t.integer "result_promming4"
    t.integer "result_prommaxg1"
    t.integer "result_prommaxg2"
    t.integer "result_prommaxg3"
    t.integer "result_prommaxg4"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.string "result_profesors"
    t.decimal "result_promg1n"
    t.decimal "result_promg2n"
    t.decimal "result_promg3n"
    t.decimal "result_promg4n"
  end

  create_table "user_tables", force: :cascade do |t|
    t.string "user_name"
    t.string "user_mail"
    t.integer "user_rol"
    t.integer "user_cargo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_password"
  end

  add_foreign_key "cursos", "asignaturas", name: "curso_asign_id"
  add_foreign_key "cursos_profesors", "cursos", name: "curso_id"
  add_foreign_key "cursos_profesors", "profesors", name: "profesor_id"
  add_foreign_key "pregunta", "resultado_encuesta", name: "preguntas_id_result"
  add_foreign_key "profesors_resultado_encuesta", "profesors", name: "profesor_id_f"
  add_foreign_key "profesors_resultado_encuesta", "resultado_encuesta", name: "result_id_f"
  add_foreign_key "resultado_encuesta", "user_tables", column: "id", name: "user_id"
end
