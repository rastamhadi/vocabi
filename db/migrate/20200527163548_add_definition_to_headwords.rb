class AddDefinitionToHeadwords < ActiveRecord::Migration[6.0]
  def change
    add_column :headwords, :definition, :string, null: false, default: ''
  end
end
