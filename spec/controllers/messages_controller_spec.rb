# frozen_string_literal: true

require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it '@userに正しい値が入っていること' do
        get :index, params: { user_id: user.id }
        expect(assigns(:user)).to eq user
      end

      it '@messagesに正しい値が入っていること' do
        event = create(:event)
        participant = create(:participant, event_id: event.id, user_id: user.id)
        messages = create_list(:message, 3, event_id: event.id, user_id: user.id)
        get :index, params: { user_id: user.id }
        expect(assigns(:messages)).to match(messages.sort { |a, b| b.id <=> a.id })
      end

      it 'index.html.erbに遷移すること' do
        get :index, params: { user_id: user.id }
        expect(response).to render_template :index
      end

      it 'ユーザー画面にリダイレクトすること' do
        another_user = create(:user)
        get :index, params: { user_id: another_user.id }
        expect(response).to redirect_to(user_path(another_user))
      end
    end

    context 'ログインしてない場合' do
      it 'ログイン画面にリダイレクトすること' do
        get :index, params: { user_id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
