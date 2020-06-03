class ParticipantsController < ApplicationController
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
  def participant_params
    params.permit().merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
