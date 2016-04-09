require 'rails_helper'

RSpec.describe "portal_banners/index", type: :view do
  before(:each) do
    assign(:portal_banners, [
      PortalBanner.create!(
        :title => "Title",
        :image => "Image",
        :link => "Link"
      ),
      PortalBanner.create!(
        :title => "Title",
        :image => "Image",
        :link => "Link"
      )
    ])
  end

  it "renders a list of portal_banners" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
