class AddPersonIdToEmotionDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :emotion_data, :person_id, :integer
  end
end
