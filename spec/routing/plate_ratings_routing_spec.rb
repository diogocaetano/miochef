require "rails_helper"

RSpec.describe PlateRatingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plate_ratings").to route_to("plate_ratings#index")
    end

    it "routes to #new" do
      expect(:get => "/plate_ratings/new").to route_to("plate_ratings#new")
    end

    it "routes to #show" do
      expect(:get => "/plate_ratings/1").to route_to("plate_ratings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/plate_ratings/1/edit").to route_to("plate_ratings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/plate_ratings").to route_to("plate_ratings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plate_ratings/1").to route_to("plate_ratings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plate_ratings/1").to route_to("plate_ratings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plate_ratings/1").to route_to("plate_ratings#destroy", :id => "1")
    end

  end
end
