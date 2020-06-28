# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :correct_user, only: %i[edit update destroy]
  add_breadcrumb 'イベント', :events_path

  def index
    @events = Event.all.order('id DESC').page(params[:page]).per(36)
  end

  def new
    @event = Event.new
    add_breadcrumb '新規作成'
  end

  def create
    Event.create(event_params)
    redirect_to root_path, notice: 'イベントが作成されました'
  end

  def show
    @event = Event.find(params[:id])
    @disabled = if user_signed_in? && current_user == @event.host || @event.guests.include?(current_user)
                  ''
                else
                  'disabled'
                end
    @participant = Participant.new
    @guests = @event.guests
    @messages = @event.messages.order('id DESC').limit(12)
    add_breadcrumb @event.title.to_s
  end

  def edit
    @event = Event.find(params[:id])
    add_breadcrumb @event.title.to_s, event_path(@event)
    add_breadcrumb '編集'
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

  def search
    @events = Event.where('title LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json 
    end
  end

  private

  def correct_user
    event = Event.find(params[:id])
    redirect_to event_path, alert: 'ログイン中のユーザーには権限がありません' if event.user_id != current_user.id
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :address, :image).merge(user_id: current_user.id)
  end
end
