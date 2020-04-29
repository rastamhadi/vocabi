# frozen_string_literal: true

class CreateHeadwords < ActiveRecord::Migration[6.0]
  def change
    create_table :headwords do |t|
      t.string :word

      t.timestamps
    end
  end
end
