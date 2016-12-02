class CreateTotemData < ActiveRecord::Migration[5.0]
  def change
    create_table :totem_data do |t|
      t.string :state

      t.timestamps
    end
  end
end
