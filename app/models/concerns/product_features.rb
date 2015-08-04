module ProductFeatures
  extend ActiveSupport::Concern

  def features_hash
    self.features.to_h
  end

  def set_feature(features = {})
    product_features = features_hash
    features.each { |key, value| product_features[key] = value }
    self.features = product_features.to_a
  end

  def delete_feature(title)
    product_features = features_hash
    product_features.delete(title)
    self.features = product_features.to_a
  end

  def features_from_subcategory
    self.subcategory.features.each do |feature|
      self.features << [feature,""]
    end
  end
end