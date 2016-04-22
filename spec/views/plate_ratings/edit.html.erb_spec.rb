require 'rails_helper'

RSpec.describe "plate_ratings/edit", type: :view do
  before(:each) do
    @plate_rating = assign(:plate_rating, PlateRating.create!(
      :client => nil,
      :plate => nil,
      :score => 1
    ))
  end

  it "renders the edit plate_rating form" do
    render

    assert_select "form[action=?][method=?]", plate_rating_path(@plate_rating), "post" do

      assert_select "input#plate_rating_client_id[name=?]", "plate_rating[client_id]"

      assert_select "input#plate_rating_plate_id[name=?]", "plate_rating[plate_id]"

      assert_select "input#plate_rating_score[name=?]", "plate_rating[score]"
    end
  end
end
