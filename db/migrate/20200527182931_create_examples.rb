class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.string :sentence, null: false
      t.string :meaning, null: false

      t.timestamps
    end
  end
end
