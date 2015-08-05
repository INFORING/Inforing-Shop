class Web::Admin::Shop::UsersController < Web::Admin::Shop::ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end