require 'test_helper'

class DailyMenusControllerTest < ActionController::TestCase
  setup do
    @daily_menu = daily_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_menu" do
    assert_difference('DailyMenu.count') do
      post :create, daily_menu: {  }
    end

    assert_redirected_to daily_menu_path(assigns(:daily_menu))
  end

  test "should show daily_menu" do
    get :show, id: @daily_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_menu
    assert_response :success
  end

  test "should update daily_menu" do
    patch :update, id: @daily_menu, daily_menu: {  }
    assert_redirected_to daily_menu_path(assigns(:daily_menu))
  end

  test "should destroy daily_menu" do
    assert_difference('DailyMenu.count', -1) do
      delete :destroy, id: @daily_menu
    end

    assert_redirected_to daily_menus_path
  end
end
