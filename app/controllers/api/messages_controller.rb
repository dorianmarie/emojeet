class Api::MessagesController < ApiController
  before_action :require_current_user, only: [:create, :destroy]

  def index
    @messages = Message.order(created_at: :desc)
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      render_success
    else
      render_error(@message.full_error_messages)
    end
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy!

    render_success
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
