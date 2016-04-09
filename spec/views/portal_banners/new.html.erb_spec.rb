require 'rails_helper'

RSpec.describe "portal_banners/new", type: :view do
  before(:each) do
    assign(:portal_banner, PortalBanner.new(
      :title => "MyString",
      :image => "MyString",
      :link => "MyString"
    ))
  end

  it "renders new portal_banner form" do
    render

    assert_select "form[action=?][method=?]", portal_banners_path, "post" do

      assert_select "input#portal_banner_title[name=?]", "portal_banner[title]"

      assert_select "input#portal_banner_image[name=?]", "portal_banner[image]"

      assert_select "input#portal_banner_link[name=?]", "portal_banner[link]"
    end
  end
end
