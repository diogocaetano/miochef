require 'rails_helper'

RSpec.describe "chef_ratings/show", type: :view do
  before(:each) do
    @chef_rating = assign(:chef_rating, ChefRating.create!(
      :client => nil,
      :chef => nil,
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
