# frozen_string_literal: true

class UsersController < ApplicationController
  add_breadcrumb 'ユーザー'

  def show
    @user = User.find(params[:id])
    @host_events = @user.host_events.order('id DESC').limit(12)
    @guest_events = @user.guest_events.order('id DESC').limit(12)
    @messages = (@user.sended_messages + @user.received_messages).uniq.sort.reverse.first(12)
    add_breadcrumb @user.user_name.to_s
  end
end
