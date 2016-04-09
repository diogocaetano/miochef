require 'rails_helper'

RSpec.describe "chef_ratings/edit", type: :view do
  before(:each) do
    @chef_rating = assign(:chef_rating, ChefRating.create!(
      :client => nil,
      :chef => nil,
      :score => 1
    ))
  end

  it "renders the edit chef_rating form" do
    render

    assert_select "form[action=?][method=?]", chef_rating_path(@chef_rating), "post" do

      assert_select "input#chef_rating_client_id[name=?]", "chef_rating[client_id]"

      assert_select "input#chef_rating_chef_id[name=?]", "chef_rating[chef_id]"

      assert_select "input#chef_rating_score[name=?]", "chef_rating[score]"
    end
  end
end
