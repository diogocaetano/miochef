require 'rails_helper'

RSpec.describe "plate_ratings/index", type: :view do
  before(:each) do
    assign(:plate_ratings, [
      PlateRating.create!(
        :client => nil,
        :plate => nil,
        :score => 1
      ),
      PlateRating.create!(
        :client => nil,
        :plate => nil,
        :score => 1
      )
    ])
  end

  it "renders a list of plate_ratings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
