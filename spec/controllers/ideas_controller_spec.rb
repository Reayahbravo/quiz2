require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "GET #—no_assets" do
    it "returns http success" do
      get :—no_assets
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #—no_helper" do
    it "returns http success" do
      get :—no_helper
      expect(response).to have_http_status(:success)
    end
  end

end
