# frozen_string_literal: true

class HostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = Event.where(user_id: params[:user_id]).order('id DESC').page(params[:page]).per(30)
  end
end
