class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :mail
      t.string :full_name
      t.string :phone
      t.string :city
      t.string :address
      t.string :postcode
      t.string :delivery
      t.text :items
      t.integer :status

      t.timestamps null: false
    end
  end
end
