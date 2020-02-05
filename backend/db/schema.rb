# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_203_201_119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'avaliations', force: :cascade do |t|
    t.bigint 'evaluator_id'
    t.bigint 'evaluated_id', null: false
    t.text 'observations'
    t.integer 'organization', null: false
    t.integer 'responsibility', null: false
    t.integer 'proactivity', null: false
    t.integer 'team_work', null: false
    t.integer 'creativity', null: false
    t.integer 'focus', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['evaluated_id'], name: 'index_avaliations_on_evaluated_id'
    t.index ['evaluator_id'], name: 'index_avaliations_on_evaluator_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', limit: 200, null: false
    t.integer 'role', null: false
    t.string 'email', limit: 100, default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'avaliations', 'users', column: 'evaluated_id'
  add_foreign_key 'avaliations', 'users', column: 'evaluator_id'
end
