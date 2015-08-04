class Product < ActiveRecord::Base
  include ProductFeatures

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :subcategory
end
