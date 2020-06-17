# frozen_string_literal: true

class HostsController < ApplicationController
  add_breadcrumb 'ユーザー'

  def index
    @user = User.find(params[:user_id])
    @host_events = @user.host_events.order('id DESC').page(params[:page]).per(36)
    add_breadcrumb @user.user_name.to_s, user_path(@user)
    add_breadcrumb '主催イベント'
  end
end
