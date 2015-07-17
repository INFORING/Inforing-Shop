class Feature < ActiveRecord::Base
  validates :title, presence: true
  validates :value, presence: true

  belongs_to :subcategory
end
