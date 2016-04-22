require 'rails_helper'

RSpec.describe "plate_ratings/show", type: :view do
  before(:each) do
    @plate_rating = assign(:plate_rating, PlateRating.create!(
      :client => nil,
      :plate => nil,
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
