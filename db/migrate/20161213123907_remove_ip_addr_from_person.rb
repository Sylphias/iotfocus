class RemoveIpAddrFromPerson < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :ip_addr, :string
  end
end
