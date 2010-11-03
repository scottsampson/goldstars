require 'test_helper'

class AwardTypesControllerTest < ActionController::TestCase
  setup do
    @award_type = award_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:award_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create award_type" do
    assert_difference('AwardType.count') do
      post :create, :award_type => @award_type.attributes
    end

    assert_redirected_to award_type_path(assigns(:award_type))
  end

  test "should show award_type" do
    get :show, :id => @award_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @award_type.to_param
    assert_response :success
  end

  test "should update award_type" do
    put :update, :id => @award_type.to_param, :award_type => @award_type.attributes
    assert_redirected_to award_type_path(assigns(:award_type))
  end

  test "should destroy award_type" do
    assert_difference('AwardType.count', -1) do
      delete :destroy, :id => @award_type.to_param
    end

    assert_redirected_to award_types_path
  end
end
