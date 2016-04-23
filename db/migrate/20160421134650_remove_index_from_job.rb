class RemoveIndexFromJob < ActiveRecord::Migration
  def change
    remove_index :jobs, column: :slug
  end
end
