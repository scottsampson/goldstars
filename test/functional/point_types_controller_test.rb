require 'test_helper'

class PointTypesControllerTest < ActionController::TestCase
  setup do
    @point_type = point_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_type" do
    assert_difference('PointType.count') do
      post :create, :point_type => @point_type.attributes
    end

    assert_redirected_to point_type_path(assigns(:point_type))
  end

  test "should show point_type" do
    get :show, :id => @point_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @point_type.to_param
    assert_response :success
  end

  test "should update point_type" do
    put :update, :id => @point_type.to_param, :point_type => @point_type.attributes
    assert_redirected_to point_type_path(assigns(:point_type))
  end

  test "should destroy point_type" do
    assert_difference('PointType.count', -1) do
      delete :destroy, :id => @point_type.to_param
    end

    assert_redirected_to point_types_path
  end
end
