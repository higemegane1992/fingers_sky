# frozen_string_literal: true

require 'rails_helper'

describe GuestsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it '@eventsに正しい値が入っていること' do
      participants = create_list(:participant, 3, user_id: user.id)
      guests = []
      participants.each do |participant|
        guests.push(participant.event)
      end
      get :index, params: { user_id: user.id }
      expect(assigns(:events)).to match(guests.sort { |a, b| b.id <=> a.id })
    end

    it 'index.html.erbに遷移すること' do
      participants = create_list(:participant, 3, user_id: user.id)
      guests = []
      participants.each do |participant|
        guests.push(participant.event)
      end
      get :index, params: { user_id: user.id }
      expect(response).to render_template :index
    end
  end
end
