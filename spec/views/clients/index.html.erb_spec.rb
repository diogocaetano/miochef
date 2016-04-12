require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :name => "Name",
        :last_name => "Last Name",
        :email => "Email",
        :cep => "Cep"
      ),
      Client.create!(
        :name => "Name",
        :last_name => "Last Name",
        :email => "Email",
        :cep => "Cep"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
  end
end
