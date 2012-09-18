require 'test_helper'

class FloadsControllerTest < ActionController::TestCase
  setup do
    @fload = floads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:floads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fload" do
    assert_difference('Fload.count') do
      post :create, :fload => {  }
    end

    assert_redirected_to fload_path(assigns(:fload))
  end

  test "should show fload" do
    get :show, :id => @fload
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fload
    assert_response :success
  end

  test "should update fload" do
    put :update, :id => @fload, :fload => {  }
    assert_redirected_to fload_path(assigns(:fload))
  end

  test "should destroy fload" do
    assert_difference('Fload.count', -1) do
      delete :destroy, :id => @fload
    end

    assert_redirected_to floads_path
  end
end
