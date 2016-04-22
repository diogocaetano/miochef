require 'rails_helper'

RSpec.describe "chef_ratings/index", type: :view do
  before(:each) do
    assign(:chef_ratings, [
      ChefRating.create!(
        :client => nil,
        :chef => nil,
        :score => 1
      ),
      ChefRating.create!(
        :client => nil,
        :chef => nil,
        :score => 1
      )
    ])
  end

  it "renders a list of chef_ratings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
