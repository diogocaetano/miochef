require 'rails_helper'

RSpec.describe "requests/new", type: :view do
  before(:each) do
    assign(:request, Request.new(
      :client => nil,
      :client_address => nil,
      :payment_code => "MyString",
      :delivery_window => "MyString",
      :request_status => nil
    ))
  end

  it "renders new request form" do
    render

    assert_select "form[action=?][method=?]", requests_path, "post" do

      assert_select "input#request_client_id[name=?]", "request[client_id]"

      assert_select "input#request_client_address_id[name=?]", "request[client_address_id]"

      assert_select "input#request_payment_code[name=?]", "request[payment_code]"

      assert_select "input#request_delivery_window[name=?]", "request[delivery_window]"

      assert_select "input#request_request_status_id[name=?]", "request[request_status_id]"
    end
  end
end
