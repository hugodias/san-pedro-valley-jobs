class AddSlugToJob < ActiveRecord::Migration
  def change
    add_index :jobs, :slug, unique: true
  end
end
