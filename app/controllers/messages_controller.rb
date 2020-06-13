class MessagesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @messages = user.messages.order('id DESC').page(params[:page]).per(30)
  end
end
