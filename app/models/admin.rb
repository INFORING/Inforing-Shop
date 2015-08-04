class Admin < ActiveRecord::Base

  has_secure_password

  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
