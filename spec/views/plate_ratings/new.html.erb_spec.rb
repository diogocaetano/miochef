require 'rails_helper'

RSpec.describe "plate_ratings/new", type: :view do
  before(:each) do
    assign(:plate_rating, PlateRating.new(
      :client => nil,
      :plate => nil,
      :score => 1
    ))
  end

  it "renders new plate_rating form" do
    render

    assert_select "form[action=?][method=?]", plate_ratings_path, "post" do

      assert_select "input#plate_rating_client_id[name=?]", "plate_rating[client_id]"

      assert_select "input#plate_rating_plate_id[name=?]", "plate_rating[plate_id]"

      assert_select "input#plate_rating_score[name=?]", "plate_rating[score]"
    end
  end
end
