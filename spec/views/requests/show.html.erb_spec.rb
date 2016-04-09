require 'rails_helper'

RSpec.describe "requests/show", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :references => "",
      :references => "",
      :payment_code => "Payment Code",
      :delivery_window => "Delivery Window",
      :references => ""
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
