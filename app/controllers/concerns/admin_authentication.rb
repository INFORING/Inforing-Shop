module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?, :signed_out?
    before_action :authenticate!
  end

  class_methods do
    def skip_authentication(*args)
      skip_before_action :authenticate!, *args
    end
  end

  private

  def sign_in(admin)
    session[:admin_id] = admin.id
  end

  def sign_out
    session.delete :admin_id
  end

  def current_user
    @current_user ||= Admin.find_by id: session[:admin_id]
  end

  def signed_in?
    current_user.present?
  end

  def signed_out?
    ! signed_in?
  end

  def authenticate!
    return if signed_in?
    redirect_to new_admin_session_path
  end
end