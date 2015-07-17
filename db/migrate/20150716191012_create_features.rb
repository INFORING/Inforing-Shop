class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :subcategory_id
      t.string :title
      t.text :value

      t.timestamps null: false
    end
  end
end
