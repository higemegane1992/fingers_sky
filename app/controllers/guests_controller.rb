# frozen_string_literal: true

class GuestsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @guest_events = user.guest_events.order('id DESC').page(params[:page]).per(30)
  end
end
