require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe '#index' do
    def do_request(params = {})
      get :index, params: params
    end

    let(:admin) { FactoryBot.create(:user, role: 'admin') }
    before { sign_in admin }

    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }

    it 'render users list' do
      do_request
      expect(assigns(:users).size).to eq 2
      expect(response).to  render_template :index
    end
  end

  describe '#show' do
  end

  describe '#destroy' do
  end

end
