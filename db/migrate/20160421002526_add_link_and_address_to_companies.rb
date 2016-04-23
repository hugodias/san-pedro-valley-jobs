class AddLinkAndAddressToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address, :string
    add_column :companies, :link, :string
  end
end
