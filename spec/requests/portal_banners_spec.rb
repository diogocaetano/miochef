require 'rails_helper'

RSpec.describe "PortalBanners", type: :request do
  describe "GET /portal_banners" do
    it "works! (now write some real specs)" do
      get portal_banners_path
      expect(response).to have_http_status(200)
    end
  end
end
