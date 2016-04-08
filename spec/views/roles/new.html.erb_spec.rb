require 'rails_helper'

RSpec.describe "roles/new", type: :view do
  before(:each) do
  	@role = create(:role)
  	assign(:role, @role)   
  	@user = create(:user, :role_id => @role.id)
  	sign_in @user
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do
    end
  end
end
