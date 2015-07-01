class Web::UsersController < Web::ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit
  end
end