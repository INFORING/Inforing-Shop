module SubcategoryFeatures
  extend ActiveSupport::Concern

  def add_feature(title)
    self.features << title
  end

  def delete_feature(title)
    self.features.delete(title)
  end
end