require 'rails_helper'

RSpec.describe "window_requests/new", type: :view do
  before(:each) do
    assign(:window_request, WindowRequest.new())
  end

  it "renders new window_request form" do
    render

    assert_select "form[action=?][method=?]", window_requests_path, "post" do
    end
  end
end
