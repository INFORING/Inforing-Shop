class Subcategory < ActiveRecord::Base
  validates :title, presence: true
  validates :category_id, presence: true

  belongs_to :category
  has_many :products
  has_many :features

end
