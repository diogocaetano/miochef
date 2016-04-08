require 'rails_helper'

RSpec.describe "roles/show", type: :view do

  before(:each) do
 	@role = create(:role)
  	assign(:role, @role)   
  	@user = create(:user, :role_id => @role.id)
  	sign_in @user
  end
  
  it "renders attributes in <p>" do
    render
  end
end
