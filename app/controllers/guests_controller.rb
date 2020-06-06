class GuestsController < ApplicationController
  def index
    event_ids = []
    participants = Participant.where(user_id: params[:user_id])
    participants.each do |participant|
      event_ids.push(participant.event_id)
    end
    @events = Event.where(:id => event_ids).order('id DESC').page(params[:page]).per(30)
  end
end
