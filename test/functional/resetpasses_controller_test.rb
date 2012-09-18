require 'test_helper'

class ResetpassesControllerTest < ActionController::TestCase
  setup do
    @resetpass = resetpasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resetpasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resetpass" do
    assert_difference('Resetpass.count') do
      post :create, :resetpass => { :email => @resetpass.email }
    end

    assert_redirected_to resetpass_path(assigns(:resetpass))
  end

  test "should show resetpass" do
    get :show, :id => @resetpass
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @resetpass
    assert_response :success
  end

  test "should update resetpass" do
    put :update, :id => @resetpass, :resetpass => { :email => @resetpass.email }
    assert_redirected_to resetpass_path(assigns(:resetpass))
  end

  test "should destroy resetpass" do
    assert_difference('Resetpass.count', -1) do
      delete :destroy, :id => @resetpass
    end

    assert_redirected_to resetpasses_path
  end
end
