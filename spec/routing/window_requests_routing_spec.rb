require "rails_helper"

RSpec.describe WindowRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/window_requests").to route_to("window_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/window_requests/new").to route_to("window_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/window_requests/1").to route_to("window_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/window_requests/1/edit").to route_to("window_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/window_requests").to route_to("window_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/window_requests/1").to route_to("window_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/window_requests/1").to route_to("window_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/window_requests/1").to route_to("window_requests#destroy", :id => "1")
    end

  end
end
