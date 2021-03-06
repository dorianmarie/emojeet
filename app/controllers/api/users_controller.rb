class Api::UsersController < ApiController
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render_success
    else
      render_error(@user.full_error_messages)
    end
  end

  def show
    @user = User.find_by!(name: params[:id])
  end

  def current
    if !current_user
      render json: nil
      return
    end

    @user = current_user
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
