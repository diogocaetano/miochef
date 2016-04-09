require 'rails_helper'

RSpec.describe "requests/show", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :client => nil,
      :client_address => nil,
      :payment_code => "Payment Code",
      :delivery_window => "Delivery Window",
      :request_status => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Payment Code/)
    expect(rendered).to match(/Delivery Window/)
    expect(rendered).to match(//)
  end
end
