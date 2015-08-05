class ProductFeatureForm
  include ActiveModel::Model

  attr_accessor :title, :value

  validates :title, presence: true
  validates :value, presence: true
end