# frozen_string_literal: true

class CreateInflections < ActiveRecord::Migration[6.0]
  def change
    create_table :inflections do |t|
      t.references :headword, null: false, foreign_key: true
      t.string :word, null: false
      t.string :inflector, null: false

      t.timestamps
      t.index %i[headword_id inflector], unique: true
    end
  end
end
