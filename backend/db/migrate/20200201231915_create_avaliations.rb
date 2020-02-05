# frozen_string_literal: true

class CreateAvaliations < ActiveRecord::Migration[6.0]
  def change
    create_table :avaliations do |t|
      t.references :evaluator, references: :users, foreign_key: { to_table: :users }, index: true
      t.references :evaluated, references: :users, foreign_key: { to_table: :users }, index: true, null: false
      t.text :observations
      t.integer :organization, null: false
      t.integer :responsibility, null: false
      t.integer :proactivity, null: false
      t.integer :team_work, null: false
      t.integer :creativity, null: false
      t.integer :focus, null: false
      t.timestamps
    end
  end
end
