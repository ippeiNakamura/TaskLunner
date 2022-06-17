require 'rails_helper'

RSpec.describe "Tasktables", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/tasktable/index"
      expect(response).to have_http_status(:success)
    end
  end

end
