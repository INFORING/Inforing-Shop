class Order < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true
  validates :delivery, presence: true
  validates :full_name, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :address, presence: true

  def self.statuses
    [['Ожидает оплаты', 0], ['Оплачен', 1],  ['Доставка', 2], ['Доставлен', 3], ['Отменен', 5], ['Возврат', 6]]
  end

  def cart
    OrderCart.new(items)
  end

  def user_update_attributes!
    usr = user
    usr.update(phone: phone, full_name: full_name, postcode: postcode, city: city, adress: address)
    usr
  end

  def user
    User.find_by(mail: mail)
  end

  def user_from_attributes
    User.new(mail: mail, phone: phone, full_name: full_name, postcode: postcode, city: city, adress: address)
  end

  def status_title
    Order.statuses.to_h.key(status)
  end
end
