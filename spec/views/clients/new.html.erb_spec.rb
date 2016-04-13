require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      :name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :cep => "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input#client_name[name=?]", "client[name]"

      assert_select "input#client_last_name[name=?]", "client[last_name]"

      assert_select "input#client_email[name=?]", "client[email]"

      assert_select "input#client_cep[name=?]", "client[cep]"
    end
  end
end
