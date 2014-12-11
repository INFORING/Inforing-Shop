class CatalogItem < ActiveRecord::Base
	validates :title,  presence: true
  validates :description,  presence: true
  validates :price,  presence: true

  belongs_to :catalog_category
	has_many :attached_images, dependent: :destroy
end
