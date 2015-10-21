class Cart
  attr_accessor :cart_id

  def initialize(cart_id)
    @cart_id = "Cart-#{cart_id}"
  end

  def add(id)
    $redis.sadd cart_id, "#{id}-1"
    $redis.expire cart_id, 86400
  end

  def item_count(id,count)
    id = item_name(id)
    current_count = id.split('-')[-1].to_i
    unless current_count == 1 and count.to_i < 0
      $redis.srem(cart_id, id)
      current_count+= count.to_i
      $redis.sadd cart_id, "#{id.split("-")[0]}-#{current_count}"
    end
  end

  def order!
    cart = $redis.smembers(cart_id)
    clean
    cart
  end

  def remove(id)
    id = item_name(id)
    $redis.srem cart_id, id
    clean if empty?
  end

  def clean
    $redis.del cart_id
  end

  def empty?
    $redis.smembers(cart_id).empty?
  end

  def items
    items = []

    $redis.smembers(cart_id).each do |value|
      items << Product.find(value.split("-")[0])
      items[-1].count = value.split("-")[-1].to_i
    end
    items.sort
  end

  def id
    cart_id.split('-')[-1].to_i
  end

  def price
    items = self.items
    price = 0

    items.each do |item|
      price += (item.price * item.count.to_i)
    end
    price
  end

  def self.count
    $redis.keys.count
  end

  def self.last
    Cart.new($redis.keys.sort[-1])
  end

  private

  def item_name(id)
    $redis.smembers(cart_id).join(",").match(/(#{id}-\d*)/)[1]
  end
end