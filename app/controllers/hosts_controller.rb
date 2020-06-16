# frozen_string_literal: true

class HostsController < ApplicationController
  add_breadcrumb "ユーザー"
  
  def index
    @user = User.find(params[:user_id])
    @events = Event.where(user_id: params[:user_id]).order('id DESC').page(params[:page]).per(30)
    add_breadcrumb "#{@user.user_name}", user_path(@user)
    add_breadcrumb "主催イベント"
  end
end
