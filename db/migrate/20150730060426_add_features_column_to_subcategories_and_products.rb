class AddFeaturesColumnToSubcategoriesAndProducts < ActiveRecord::Migration
  def change
    add_column :subcategories, :features, :text, array: true, default: []
    add_column :products, :features, :text, array: true, default: []
  end
end
