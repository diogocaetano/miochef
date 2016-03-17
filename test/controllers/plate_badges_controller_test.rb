require 'test_helper'

class PlateBadgesControllerTest < ActionController::TestCase
  setup do
    @plate_badge = plate_badges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plate_badges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plate_badge" do
    assert_difference('PlateBadge.count') do
      post :create, plate_badge: { description: @plate_badge.description, image: @plate_badge.image, name: @plate_badge.name }
    end

    assert_redirected_to plate_badge_path(assigns(:plate_badge))
  end

  test "should show plate_badge" do
    get :show, id: @plate_badge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plate_badge
    assert_response :success
  end

  test "should update plate_badge" do
    patch :update, id: @plate_badge, plate_badge: { description: @plate_badge.description, image: @plate_badge.image, name: @plate_badge.name }
    assert_redirected_to plate_badge_path(assigns(:plate_badge))
  end

  test "should destroy plate_badge" do
    assert_difference('PlateBadge.count', -1) do
      delete :destroy, id: @plate_badge
    end

    assert_redirected_to plate_badges_path
  end
end
