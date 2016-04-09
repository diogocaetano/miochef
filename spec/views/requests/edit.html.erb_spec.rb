require 'rails_helper'

RSpec.describe "requests/edit", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :references => "",
      :references => "",
      :payment_code => "MyString",
      :delivery_window => "MyString",
      :references => ""
    ))
  end

  it "renders the edit request form" do
    render

    assert_select "form[action=?][method=?]", request_path(@request), "post" do

      assert_select "input#request_references[name=?]", "request[references]"

      assert_select "input#request_references[name=?]", "request[references]"

      assert_select "input#request_payment_code[name=?]", "request[payment_code]"

      assert_select "input#request_delivery_window[name=?]", "request[delivery_window]"

      assert_select "input#request_references[name=?]", "request[references]"
    end
  end
end
