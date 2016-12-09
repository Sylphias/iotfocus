class AddIpAddrToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :ip_addr, :text
  end
end
