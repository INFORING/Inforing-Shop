class DeleteOldShit < ActiveRecord::Migration
  def change
    drop_table :catalog_categories
    drop_table :catalog_items
    drop_table :shop_categories
    drop_table :shop_items
    drop_table :shop_subcategories
    drop_table :shop_trees
  end
end
