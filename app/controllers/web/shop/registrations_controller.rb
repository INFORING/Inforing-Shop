class Web::Shop::RegistrationsController < Web::Shop::ApplicationController
  skip_authentication

  def create
    @user = User.new(registration_params)

    if @user.save
      sign_in @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def new_from_order
    @user = Order.find(params[:id]).user_from_attributes
  end

  def create_from_order
    user = User.new(registration_params)
    binding.pry
    if user.save
      sign_in @user
      redirect_to categories_path
    else
      redirect_to :back
    end
  end

  private

  def registration_params
    params.require(:user).permit(:mail, :login, :password, :password_confirmation, :phone, :full_name, :adress, :city, :postcode)
  end
end