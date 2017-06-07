require 'rails_helper'

RSpec.describe GraphicsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #bitcoin" do
    it "returns http success" do
      get :bitcoin
      expect(response).to have_http_status(:success)
    end
  end

end
