class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @site_address = user.site_address
    @events = user.events.order('id DESC').page(params[:page]).per(30)
  end
end
