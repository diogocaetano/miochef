require 'rails_helper'

RSpec.describe "roles/show", type: :view do

  before(:each) do
    @role = assign(:role, Role.create!({id: 1, name: "Administrador", }))
    @user = assign(:user, User.create!({"role_id"=>1, "name"=>"diogo", "email"=>"diogo.caetano.alves@gmail.com", "password"=>"teste123", "is_dev" => false, "password_confirmation"=>"teste123"}))
  end

  it "renders attributes in <p>" do
    render
  end
end
