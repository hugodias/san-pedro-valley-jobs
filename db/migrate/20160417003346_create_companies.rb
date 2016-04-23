class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :website
      t.string :email
      t.string :logo

      t.timestamps null: false
    end
  end
end
