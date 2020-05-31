class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user_name = user.user_name
    @events = user.events.order('id DESC').page(params[:page]).per(30)
  end
end
