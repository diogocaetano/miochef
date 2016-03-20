require 'test_helper'

class ChefsControllerTest < ActionController::TestCase
  setup do
    @chef = chefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef" do
    assert_difference('Chef.count') do
      post :create, chef: { academic_education: @chef.academic_education, born_date: @chef.born_date, country_id: @chef.country_id, cpf: @chef.cpf, description: @chef.description, email: @chef.email, name: @chef.name, naturalness: @chef.naturalness, phone_one: @chef.phone_one, phone_two: @chef.phone_two, rg: @chef.rg, specialty: @chef.specialty, university: @chef.university }
    end

    assert_redirected_to chef_path(assigns(:chef))
  end

  test "should show chef" do
    get :show, id: @chef
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chef
    assert_response :success
  end

  test "should update chef" do
    patch :update, id: @chef, chef: { academic_education: @chef.academic_education, born_date: @chef.born_date, country_id: @chef.country_id, cpf: @chef.cpf, description: @chef.description, email: @chef.email, name: @chef.name, naturalness: @chef.naturalness, phone_one: @chef.phone_one, phone_two: @chef.phone_two, rg: @chef.rg, specialty: @chef.specialty, university: @chef.university }
    assert_redirected_to chef_path(assigns(:chef))
  end

  test "should destroy chef" do
    assert_difference('Chef.count', -1) do
      delete :destroy, id: @chef
    end

    assert_redirected_to chefs_path
  end
end
