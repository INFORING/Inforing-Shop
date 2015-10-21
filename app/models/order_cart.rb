class OrderCart

  def initialize(items)
    @items = items
  end

  def products
    products = []
    @items.each do |item|
      product_params = item.split('-')
      product = Product.find(product_params[0])
      product.count = product_params[1]
      products << product
    end
    products
  end

  def full_price
    price = 0
    products.each { |product| price += product.price  }
    price
  end
end