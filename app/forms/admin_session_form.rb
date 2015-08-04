class AdminSessionForm
  include ActiveModel::Model

  attr_accessor :login, :password

  validates :login, presence: true
  validates :password, presence: true

  validate do
    errors.add(:base, :wrong_email_or_password) unless user.try(:authenticate, password)
  end

  def user
    @user ||= Admin.find_by login: login
  end
end