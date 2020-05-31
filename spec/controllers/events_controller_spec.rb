# frozen_string_literal: true

require 'rails_helper'

describe EventsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it '@eventに正しい値が入っていること' do
        events = create_list(:event, 3)
        get :index
        expect(assigns(:events)).to match(events.sort { |a, b| b.id <=> a.id })
      end

      it 'index.html.erbに遷移すること' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      it '@eventに正しい値が入っていること' do
        events = create_list(:event, 3)
        get :index
        expect(assigns(:events)).to match(events.sort { |a, b| b.id <=> a.id })
      end

      it 'index.html.erbに遷移すること' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it '@eventに正しい値が入っていること ' do
        event = create(:event)
        get :show, params: { id: event }
        expect(assigns(:event)).to eq event
      end

      it 'edit.html.erbに遷移すること' do
        event = create(:event)
        get :show, params: { id: event }
        expect(response).to render_template :show
      end
    end

    context 'ログインしていない場合' do
      it '@eventに正しい値が入っていること ' do
        event = create(:event)
        get :show, params: { id: event }
        expect(assigns(:event)).to eq event
      end

      it 'edit.html.erbに遷移すること' do
        event = create(:event)
        get :show, params: { id: event }
        expect(response).to render_template :show
      end
    end
  end

  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        login_user user
      end

      it 'new.html.erbに遷移すること' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'ログインしてない場合' do
      it 'ログイン画面にリダイレクトすること' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインしていて自分の作成したイベントに対するアクションである場合' do
      before do
        login_user user
      end

      it '@eventに正しい値が入っていること ' do
        event = create(:event, user_id: user.id)
        get :edit, params: { id: event }
        expect(assigns(:event)).to eq event
      end

      it 'edit.html.erbに遷移すること' do
        event = create(:event, user_id: user.id)
        get :edit, params: { id: event }
        expect(response).to render_template :edit
      end
    end

    context 'ログインしていて自分の作成したイベントに対するアクションでない場合' do
      before do
        login_user user
      end

      it '@eventに正しい値が入っていること ' do
        event = create(:event)
        get :show, params: { id: event }
        expect(assigns(:event)).to eq event
      end

      it 'show.html.erbにリダイレクトすること' do
        event = create(:event)
        get :edit, params: { id: event }
        expect(response).to redirect_to(event_path)
      end
    end

    context 'ログインしてない場合' do
      it 'ログイン画面にリダイレクトすること' do
        event = create(:event)
        get :edit, params: { id: event }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
