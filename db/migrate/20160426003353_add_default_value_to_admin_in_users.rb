class AddDefaultValueToAdminInUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, default: false
  end
end
