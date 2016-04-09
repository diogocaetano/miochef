require 'rails_helper'

RSpec.describe "request_statuses/show", type: :view do
  before(:each) do
    @request_status = assign(:request_status, RequestStatus.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
