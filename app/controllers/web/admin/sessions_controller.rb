class Web::Admin::SessionsController < Web::Admin::ApplicationController
  skip_authentication only: [:new, :create]

  def new
    @session_form = AdminSessionForm.new()
  end

  def create
    @session_form = AdminSessionForm.new(session_form_params)

    if @session_form.valid?
      sign_in @session_form.user
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to action: :new
  end

  private

  def session_form_params
    params.require(:admin_session_form).permit(:login, :password)
  end
end