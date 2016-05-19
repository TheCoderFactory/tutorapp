require 'test_helper'

class YearLevelsControllerTest < ActionController::TestCase
  setup do
    @year_level = year_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:year_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create year_level" do
    assert_difference('YearLevel.count') do
      post :create, year_level: { description: @year_level.description, name: @year_level.name }
    end

    assert_redirected_to year_level_path(assigns(:year_level))
  end

  test "should show year_level" do
    get :show, id: @year_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @year_level
    assert_response :success
  end

  test "should update year_level" do
    patch :update, id: @year_level, year_level: { description: @year_level.description, name: @year_level.name }
    assert_redirected_to year_level_path(assigns(:year_level))
  end

  test "should destroy year_level" do
    assert_difference('YearLevel.count', -1) do
      delete :destroy, id: @year_level
    end

    assert_redirected_to year_levels_path
  end
end
