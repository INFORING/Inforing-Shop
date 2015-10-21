class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 6 }

  def information_present?
    inf = [full_name,phone,city,adress,postcode]
    !inf.any? { |i| i.blank? || i.nil? }
  end

  def to_s
    login
  end

  def orders
    Order.where('mail = ? AND status !=5', mail)
  end
end
