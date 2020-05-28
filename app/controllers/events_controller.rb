class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to root_path, notice: 'イベントが作成されました'
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path, notice: '変更が保存されました'
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path, notice: 'イベントが削除されました'
  end

  private
  def correct_user
    event = Event.find(params[:id])
    if event.user_id != current_user.id
      redirect_to event_path, alert: 'ログイン中のユーザーには権限がありません'
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :address, :image).merge(user_id: current_user.id)
  end
end
