require 'rails_helper'

RSpec.describe "request_statuses/index", type: :view do
  before(:each) do
    assign(:request_statuses, [
      RequestStatus.create!(
        :name => "Name"
      ),
      RequestStatus.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of request_statuses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
