require 'rails_helper'

RSpec.describe "portal_banners/edit", type: :view do
  before(:each) do
    @portal_banner = assign(:portal_banner, PortalBanner.create!(
      :title => "MyString",
      :image => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit portal_banner form" do
    render

    assert_select "form[action=?][method=?]", portal_banner_path(@portal_banner), "post" do

      assert_select "input#portal_banner_title[name=?]", "portal_banner[title]"

      assert_select "input#portal_banner_image[name=?]", "portal_banner[image]"

      assert_select "input#portal_banner_link[name=?]", "portal_banner[link]"
    end
  end
end
