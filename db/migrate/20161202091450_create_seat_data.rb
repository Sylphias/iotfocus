class CreateSeatData < ActiveRecord::Migration[5.0]
  def change
    create_table :seat_data do |t|
      t.boolean :is_sitting

      t.timestamps
    end
  end
end
