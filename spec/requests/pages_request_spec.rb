require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /showtop" do
    it "returns http success" do
      get "/pages/showtop"
      expect(response).to have_http_status(:success)
    end
  end

end
