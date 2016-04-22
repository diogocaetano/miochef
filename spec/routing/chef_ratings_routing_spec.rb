require "rails_helper"

RSpec.describe ChefRatingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/chef_ratings").to route_to("chef_ratings#index")
    end

    it "routes to #new" do
      expect(:get => "/chef_ratings/new").to route_to("chef_ratings#new")
    end

    it "routes to #show" do
      expect(:get => "/chef_ratings/1").to route_to("chef_ratings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/chef_ratings/1/edit").to route_to("chef_ratings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/chef_ratings").to route_to("chef_ratings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/chef_ratings/1").to route_to("chef_ratings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/chef_ratings/1").to route_to("chef_ratings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/chef_ratings/1").to route_to("chef_ratings#destroy", :id => "1")
    end

  end
end
