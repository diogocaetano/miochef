require 'test_helper'

class NutritionalTablesControllerTest < ActionController::TestCase
  setup do
    @nutritional_table = nutritional_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutritional_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nutritional_table" do
    assert_difference('NutritionalTable.count') do
      post :create, nutritional_table: { carbohydrate: @nutritional_table.carbohydrate, energetic_value: @nutritional_table.energetic_value, iron: @nutritional_table.iron, protein: @nutritional_table.protein, saturated_fat: @nutritional_table.saturated_fat, sodium: @nutritional_table.sodium, total_fat: @nutritional_table.total_fat, trans_fat: @nutritional_table.trans_fat }
    end

    assert_redirected_to nutritional_table_path(assigns(:nutritional_table))
  end

  test "should show nutritional_table" do
    get :show, id: @nutritional_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nutritional_table
    assert_response :success
  end

  test "should update nutritional_table" do
    patch :update, id: @nutritional_table, nutritional_table: { carbohydrate: @nutritional_table.carbohydrate, energetic_value: @nutritional_table.energetic_value, iron: @nutritional_table.iron, protein: @nutritional_table.protein, saturated_fat: @nutritional_table.saturated_fat, sodium: @nutritional_table.sodium, total_fat: @nutritional_table.total_fat, trans_fat: @nutritional_table.trans_fat }
    assert_redirected_to nutritional_table_path(assigns(:nutritional_table))
  end

  test "should destroy nutritional_table" do
    assert_difference('NutritionalTable.count', -1) do
      delete :destroy, id: @nutritional_table
    end

    assert_redirected_to nutritional_tables_path
  end
end
