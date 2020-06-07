require 'rails_helper'

describe HostsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it '@eventsに正しい値が入っていること' do
      hosts = create_list(:event, 3, user_id: user.id)
      get :index, params: { user_id: user.id }
      expect(assigns(:events)).to match(hosts.sort { |a, b| b.id <=> a.id })
    end

    it 'index.html.erbに遷移すること' do
      hosts = create_list(:event, 3, user_id: user.id)
      get :index, params: { user_id: user.id }
      expect(response).to render_template :index
    end
  end
end
