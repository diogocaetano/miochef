require 'test_helper'

class PlateAccompanimentsControllerTest < ActionController::TestCase
  setup do
    @plate_accompaniment = plate_accompaniments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plate_accompaniments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plate_accompaniment" do
    assert_difference('PlateAccompaniment.count') do
      post :create, plate_accompaniment: { name: @plate_accompaniment.name }
    end

    assert_redirected_to plate_accompaniment_path(assigns(:plate_accompaniment))
  end

  test "should show plate_accompaniment" do
    get :show, id: @plate_accompaniment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plate_accompaniment
    assert_response :success
  end

  test "should update plate_accompaniment" do
    patch :update, id: @plate_accompaniment, plate_accompaniment: { name: @plate_accompaniment.name }
    assert_redirected_to plate_accompaniment_path(assigns(:plate_accompaniment))
  end

  test "should destroy plate_accompaniment" do
    assert_difference('PlateAccompaniment.count', -1) do
      delete :destroy, id: @plate_accompaniment
    end

    assert_redirected_to plate_accompaniments_path
  end
end
