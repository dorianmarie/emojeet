class Api::UsersController < ApiController
  before_action :require_current_user, only: :current

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
    @user = current_user
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
