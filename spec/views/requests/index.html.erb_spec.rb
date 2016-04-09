require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        :references => "",
        :references => "",
        :payment_code => "Payment Code",
        :delivery_window => "Delivery Window",
        :references => ""
      ),
      Request.create!(
        :references => "",
        :references => "",
        :payment_code => "Payment Code",
        :delivery_window => "Delivery Window",
        :references => ""
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Code".to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Window".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
