class Web::UsersController < Web::ApplicationController
  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end
end