class Api::SessionsController < ApiController
  def create
    @user = User.find_by(name: session_params[:name])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render_success
    else
      render_error("Wrong name/password combination")
    end
  end

  def destroy
    session[:user_id] = nil

    render_success
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
