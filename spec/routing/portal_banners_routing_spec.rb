require "rails_helper"

RSpec.describe PortalBannersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/portal_banners").to route_to("portal_banners#index")
    end

    it "routes to #new" do
      expect(:get => "/portal_banners/new").to route_to("portal_banners#new")
    end

    it "routes to #show" do
      expect(:get => "/portal_banners/1").to route_to("portal_banners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal_banners/1/edit").to route_to("portal_banners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/portal_banners").to route_to("portal_banners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal_banners/1").to route_to("portal_banners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal_banners/1").to route_to("portal_banners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal_banners/1").to route_to("portal_banners#destroy", :id => "1")
    end

  end
end
