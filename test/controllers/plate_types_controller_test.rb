require 'test_helper'

class PlateTypesControllerTest < ActionController::TestCase
  setup do
    @plate_type = plate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plate_type" do
    assert_difference('PlateType.count') do
      post :create, plate_type: { name: @plate_type.name }
    end

    assert_redirected_to plate_type_path(assigns(:plate_type))
  end

  test "should show plate_type" do
    get :show, id: @plate_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plate_type
    assert_response :success
  end

  test "should update plate_type" do
    patch :update, id: @plate_type, plate_type: { name: @plate_type.name }
    assert_redirected_to plate_type_path(assigns(:plate_type))
  end

  test "should destroy plate_type" do
    assert_difference('PlateType.count', -1) do
      delete :destroy, id: @plate_type
    end

    assert_redirected_to plate_types_path
  end
end
