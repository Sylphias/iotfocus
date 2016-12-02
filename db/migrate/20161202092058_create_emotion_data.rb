class CreateEmotionData < ActiveRecord::Migration[5.0]
  def change
    create_table :emotion_data do |t|
      t.string :feeling
      t.decimal :anger
      t.decimal :happiness
      t.decimal :sadness

      t.timestamps
    end
  end
end
