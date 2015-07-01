class AddInformationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :adress, :string
    add_column :users, :postcode, :string
  end
end
