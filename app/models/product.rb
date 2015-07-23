class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :subcategory
  has_many :features, through: :subcategory
end
