# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :index

  def index
    user_ids = []
    participants = Participant.where(event_id: params[:event_id])
    participants.each do |participant|
      user_ids.push(participant.user_id)
    end
    @users = User.where(id: user_ids).order('id DESC').page(params[:page]).per(30)
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
