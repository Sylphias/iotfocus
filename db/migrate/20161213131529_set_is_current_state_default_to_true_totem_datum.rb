class SetIsCurrentStateDefaultToTrueTotemDatum < ActiveRecord::Migration[5.0]
  def change
    change_column :totem_data, :is_current_state, :boolean, :default => true
  end
end
