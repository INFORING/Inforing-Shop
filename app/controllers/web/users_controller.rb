class Web::UsersController < Web::ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit( :login, :mail, :password, :password_confirmation, :full_name,
                                  :postcode, :city, :phone, :adress)
  end
end