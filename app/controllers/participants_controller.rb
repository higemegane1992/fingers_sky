# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :index
  add_breadcrumb "イベント", :events_path

  def index
    @event = Event.find(params[:event_id])
    @participants = @event.guests.order('id DESC').page(params[:page]).per(30)
    add_breadcrumb "#{@event.title}", event_path(@event)
    add_breadcrumb "参加者"
  end

  def create
    participant = Participant.create(participant_params)
    redirect_to "/events/#{participant.event.id}", notice: 'イベントに参加しました'
  end

  def destroy
    participant = Participant.find_by(user_id: current_user.id, event_id: params[:event_id])
    participant.destroy
    redirect_to "/events/#{participant.event.id}", notice: 'イベントの参加を取り消しました'
  end

  private

  def correct_user
    event = Event.find(params[:event_id])
    redirect_to event_path(event), alert: 'ログイン中のユーザーには権限がありません' if current_user.id != event.user_id && (event.participants & current_user.participants).empty?
  end

  def participant_params
    params.permit.merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
