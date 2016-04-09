require 'rails_helper'

RSpec.describe "PlateRatings", type: :request do
  describe "GET /plate_ratings" do
    it "works! (now write some real specs)" do
      get plate_ratings_path
      expect(response).to have_http_status(200)
    end
  end
end
