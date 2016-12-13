class AddIsCurrentStateToStateDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :totem_data, :is_current_state, :boolean
  end
end
