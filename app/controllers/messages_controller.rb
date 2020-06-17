# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  add_breadcrumb 'ユーザー'

  def index
    @user = User.find(params[:user_id])
    @messages = Kaminari.paginate_array((@user.sended_messages + @user.received_messages).uniq.sort.reverse).page(params[:page]).per(36)
    @message = Message.new
    add_breadcrumb @user.user_name.to_s, user_path(@user)
    add_breadcrumb 'メッセージ'
  end

  def create
    Message.create(message_params)
    redirect_to user_messages_path, notice: 'メッセージが送信されました'
  end

  private

  def correct_user
    user = User.find(params[:user_id])
    redirect_to user_path(user), alert: 'ログイン中のユーザーには権限がありません' if user.id != current_user.id
  end

  def message_params
    params.require(:message).permit(:subject, :body, :event_id).merge(user_id: current_user.id)
  end
end
