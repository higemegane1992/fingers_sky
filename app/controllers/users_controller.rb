# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @host_events = @user.host_events.order('id DESC').limit(12)
    @guest_events = @user.guest_events.order('id DESC').limit(12)
  end
end
