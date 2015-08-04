class Product < ActiveRecord::Base
  include ProductFeatures

  attr_accessor :count

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :subcategory

  def total_price
    count.nil? ? price : price * count
  end
end
