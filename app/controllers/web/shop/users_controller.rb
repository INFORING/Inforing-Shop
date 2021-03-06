class Web::Shop::UsersController < Web::Shop::ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all

    add_breadcrumb 'Профиль', @user
  end

  private

  def user_params
    params.require(:user).permit( :login, :mail, :password, :password_confirmation, :full_name,
                                  :postcode, :city, :phone, :adress)
  end
end