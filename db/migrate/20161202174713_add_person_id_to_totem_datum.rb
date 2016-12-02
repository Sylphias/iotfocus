class AddPersonIdToTotemDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :totem_data, :person_id, :integer
  end
end
