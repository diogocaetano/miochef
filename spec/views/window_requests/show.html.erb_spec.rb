require 'rails_helper'

RSpec.describe "window_requests/show", type: :view do
  before(:each) do
    @window_request = assign(:window_request, WindowRequest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
