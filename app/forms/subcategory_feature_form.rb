class SubcategoryFeatureForm
  include ActiveModel::Model

  attr_accessor :title

  validates :title, presence: true
end