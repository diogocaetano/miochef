require 'rails_helper'

RSpec.describe "portal_banners/show", type: :view do
  before(:each) do
    @portal_banner = assign(:portal_banner, PortalBanner.create!(
      :title => "Title",
      :image => "Image",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Link/)
  end
end
