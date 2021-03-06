# frozen_string_literal: true

class GuestsController < ApplicationController
  add_breadcrumb 'ユーザー'

  def index
    @user = User.find(params[:user_id])
    @guest_events = @user.guest_events.order('id DESC').page(params[:page]).per(36)
    add_breadcrumb @user.user_name.to_s, user_path(@user)
    add_breadcrumb '参加イベント'
  end
end
