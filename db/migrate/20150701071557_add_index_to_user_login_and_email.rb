class AddIndexToUserLoginAndEmail < ActiveRecord::Migration
  def change
    add_index :users, :mail, unique: true
    add_index :users, :login, unique: true
  end
end
