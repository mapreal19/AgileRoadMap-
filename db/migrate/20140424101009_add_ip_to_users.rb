class AddIpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip, :ip_address
  end
end
