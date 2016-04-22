require 'rails_helper'

RSpec.describe "WindowRequests", type: :request do
  describe "GET /window_requests" do
    it "works! (now write some real specs)" do
      get window_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
