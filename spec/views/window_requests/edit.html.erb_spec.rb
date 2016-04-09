require 'rails_helper'

RSpec.describe "window_requests/edit", type: :view do
  before(:each) do
    @window_request = assign(:window_request, WindowRequest.create!())
  end

  it "renders the edit window_request form" do
    render

    assert_select "form[action=?][method=?]", window_request_path(@window_request), "post" do
    end
  end
end
