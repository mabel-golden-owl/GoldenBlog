require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe '#create' do
    def do_request
      post :create, params: { post_id: post.id, format: 'js' }
    end

    let!(:user) { FactoryBot.create(:user) }

    before do
      user.confirm
      sign_in user
    end

    let!(:post) { FactoryBot.create(:post) }

    it 'should create new like' do
      post 'likes', params: { post_id: post.id }
      # expect { do_request }.to change { Like.count }.by(1)
      # expect(response).to redirect_to post_path(post)
    end
  end

  # describe '#destroy' do
  #   def do_request
  #     delete :destroy, xhr: true, params: { id: like.id }
  #   end

  #   let!(:user) { FactoryBot.create(:user) }
  #   before do
  #     user.confirm
  #     sign_in user
  #   end

  #   let!(:like) { FactoryBot.create(:like, user: user) }

  #   it 'should delete like' do
  #     expect { do_request }.to change { Like.count }.by(-1)
  #     expect(response).to redirect_to post_path(post)
  #   end
  # end
end
