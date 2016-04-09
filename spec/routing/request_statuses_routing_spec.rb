require "rails_helper"

RSpec.describe RequestStatusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/request_statuses").to route_to("request_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/request_statuses/new").to route_to("request_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/request_statuses/1").to route_to("request_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/request_statuses/1/edit").to route_to("request_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/request_statuses").to route_to("request_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/request_statuses/1").to route_to("request_statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/request_statuses/1").to route_to("request_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/request_statuses/1").to route_to("request_statuses#destroy", :id => "1")
    end

  end
end
