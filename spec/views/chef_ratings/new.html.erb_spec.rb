require 'rails_helper'

RSpec.describe "chef_ratings/new", type: :view do
  before(:each) do
    assign(:chef_rating, ChefRating.new(
      :client => nil,
      :chef => nil,
      :score => 1
    ))
  end

  it "renders new chef_rating form" do
    render

    assert_select "form[action=?][method=?]", chef_ratings_path, "post" do

      assert_select "input#chef_rating_client_id[name=?]", "chef_rating[client_id]"

      assert_select "input#chef_rating_chef_id[name=?]", "chef_rating[chef_id]"

      assert_select "input#chef_rating_score[name=?]", "chef_rating[score]"
    end
  end
end
