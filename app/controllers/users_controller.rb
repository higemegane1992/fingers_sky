# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events.order('id DESC').limit(12)
    @participants = @user.participants.order('id DESC').limit(12)
  end
end
