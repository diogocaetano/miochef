require 'rails_helper'

RSpec.describe "window_requests/index", type: :view do
  before(:each) do
    assign(:window_requests, [
      WindowRequest.create!(),
      WindowRequest.create!()
    ])
  end

  it "renders a list of window_requests" do
    render
  end
end
