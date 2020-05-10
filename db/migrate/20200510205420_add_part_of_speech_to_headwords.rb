class AddPartOfSpeechToHeadwords < ActiveRecord::Migration[6.0]
  def change
    add_column :headwords, :part_of_speech, :integer, null: false
  end
end
