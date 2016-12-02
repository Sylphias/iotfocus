class AddPersonIdToSeatDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :seat_data, :person_id, :integer
  end
end
