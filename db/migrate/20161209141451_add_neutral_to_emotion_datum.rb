class AddNeutralToEmotionDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :emotion_data, :neutral, :Float
  end
end
