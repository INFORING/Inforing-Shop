class Web::Shop::SessionsController < Web::Shop::ApplicationController
  skip_authentication only: [:new, :create]

  def create
    @session_form = UserSessionForm.new(session_form_params)

    if @session_form.valid?
      sign_in @session_form.user
      render json: @session_form
    else
      render json: @session_form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to categories_path
  end

  private

  def session_form_params
    params.require(:session_form).permit(:mail, :password)
  end
end