class ChangeOrderItemsFieldToArray < ActiveRecord::Migration
  def change
    remove_column :orders, :items
    add_column :orders, :items, :text, array: true, default: []
  end
end
