# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it '@userに正しい値が入っていること ' do
        user = create(:user)
        get :show, params: { id: user }
        expect(assigns(:user)).to eq user
      end

      it 'show.html.erbに遷移すること' do
        user = create(:user)
        get :show, params: { id: user }
        expect(response).to render_template :show
      end
    end

    context 'ログインしていない場合' do
      it '@userに正しい値が入っていること ' do
        user = create(:user)
        get :show, params: { id: user }
        expect(assigns(:user)).to eq user
      end

      it 'show.html.erbに遷移すること' do
        user = create(:user)
        get :show, params: { id: user }
        expect(response).to render_template :show
      end
    end
  end
end
