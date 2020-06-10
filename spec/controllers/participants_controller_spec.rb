# frozen_string_literal: true

require 'rails_helper'

describe ParticipantsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event) }

  describe 'GET #index' do
    context 'ログイン済かつ参加イベントの場合' do
      before do
        login_user user
      end

      it '@participantsに正しい値が入っていること' do
        participant = create(:participant, event_id: event.id, user_id: user.id)
        participants = create_list(:participant, 3, event_id: event.id)
        participants.push(participant)
        users = []
        participants.each do |user|
          users.push(user.user)
        end
        get :index, params: { event_id: event.id }
        expect(assigns(:participants)).to match(users.sort { |a, b| b.id <=> a.id })
      end

      it 'index.html.erbに遷移すること' do
        participant = create(:participant, event_id: event.id, user_id: user.id)
        get :index, params: { event_id: event.id }
        expect(response).to render_template :index
      end
    end

    context 'ログイン済かつ未参加イベントの場合' do
      before do
        login_user user
      end

      it 'index.html.erbに遷移すること' do
        participant = create(:participant, event_id: event.id)
        get :index, params: { event_id: event.id }
        expect(response).to redirect_to event_path(event)
      end
    end

    context 'ログインしていない場合' do
      it 'index.html.erbに遷移すること' do
        participant = create(:participant, event_id: event.id)
        get :index, params: { event_id: event.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
