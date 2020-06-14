class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages.order('id DESC').page(params[:page]).per(30)
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to user_messages_path, notice: 'メッセージが送信されました'
  end

  private

  def message_params
    params.require(:message).permit(:subject, :body, :event_id).merge(user_id: current_user.id)
  end
end
