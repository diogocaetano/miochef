require 'test_helper'

class PlatesControllerTest < ActionController::TestCase
  setup do
    @plate = plates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plate" do
    assert_difference('Plate.count') do
      post :create, plate: { active: @plate.active, available_quantity: @plate.available_quantity, chef_id: @plate.chef_id, description: @plate.description, ingredients_id: @plate.ingredients_id, photo: @plate.photo, plate_accompaniment_id: @plate.plate_accompaniment_id, plate_badge_id: @plate.plate_badge_id, plate_type_id: @plate.plate_type_id, price: @plate.price, title: @plate.title }
    end

    assert_redirected_to plate_path(assigns(:plate))
  end

  test "should show plate" do
    get :show, id: @plate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plate
    assert_response :success
  end

  test "should update plate" do
    patch :update, id: @plate, plate: { active: @plate.active, available_quantity: @plate.available_quantity, chef_id: @plate.chef_id, description: @plate.description, ingredients_id: @plate.ingredients_id, photo: @plate.photo, plate_accompaniment_id: @plate.plate_accompaniment_id, plate_badge_id: @plate.plate_badge_id, plate_type_id: @plate.plate_type_id, price: @plate.price, title: @plate.title }
    assert_redirected_to plate_path(assigns(:plate))
  end

  test "should destroy plate" do
    assert_difference('Plate.count', -1) do
      delete :destroy, id: @plate
    end

    assert_redirected_to plates_path
  end
end
