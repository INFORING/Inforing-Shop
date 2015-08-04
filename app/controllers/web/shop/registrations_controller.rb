class Web::Shop::RegistrationsController < Web::Shop::ApplicationController
  skip_authentication

  def create
    @user = User.new(registration_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(:mail, :login, :password, :password_confirmation)
  end
end