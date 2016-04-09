require 'rails_helper'

RSpec.describe "RequestStatuses", type: :request do
  describe "GET /request_statuses" do
    it "works! (now write some real specs)" do
      get request_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
