class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password_digest
      t.string :login

      t.timestamps
    end
  end
end