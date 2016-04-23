class SetDefaultValueToJobStatus < ActiveRecord::Migration
  def change
    change_column :jobs, :status, :integer, :default => 0
  end
end
