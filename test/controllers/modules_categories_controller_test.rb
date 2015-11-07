require 'test_helper'

class ModulesCategoriesControllerTest < ActionController::TestCase
  setup do
    @modules_category = modules_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modules_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modules_category" do
    assert_difference('ModulesCategory.count') do
      post :create, modules_category: { icon: @modules_category.icon, name: @modules_category.name }
    end

    assert_redirected_to modules_category_path(assigns(:modules_category))
  end

  test "should show modules_category" do
    get :show, id: @modules_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modules_category
    assert_response :success
  end

  test "should update modules_category" do
    patch :update, id: @modules_category, modules_category: { icon: @modules_category.icon, name: @modules_category.name }
    assert_redirected_to modules_category_path(assigns(:modules_category))
  end

  test "should destroy modules_category" do
    assert_difference('ModulesCategory.count', -1) do
      delete :destroy, id: @modules_category
    end

    assert_redirected_to modules_categories_path
  end
end
