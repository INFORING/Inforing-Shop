class Subcategory < ActiveRecord::Base
  include SubcategoryFeatures

  validates :title, presence: true
  validates :category_id, presence: true

  belongs_to :category
  has_many :products

end
