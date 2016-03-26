require 'test_helper'

class ChefTypesControllerTest < ActionController::TestCase
  setup do
    @chef_type = chef_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chef_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef_type" do
    assert_difference('ChefType.count') do
      post :create, chef_type: { chef_id: @chef_type.chef_id, name: @chef_type.name }
    end

    assert_redirected_to chef_type_path(assigns(:chef_type))
  end

  test "should show chef_type" do
    get :show, id: @chef_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chef_type
    assert_response :success
  end

  test "should update chef_type" do
    patch :update, id: @chef_type, chef_type: { chef_id: @chef_type.chef_id, name: @chef_type.name }
    assert_redirected_to chef_type_path(assigns(:chef_type))
  end

  test "should destroy chef_type" do
    assert_difference('ChefType.count', -1) do
      delete :destroy, id: @chef_type
    end

    assert_redirected_to chef_types_path
  end
end
