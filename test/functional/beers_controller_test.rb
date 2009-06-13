require 'test_helper'

class BeersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beer" do
    assert_difference('Beer.count') do
      post :create, :beer => { }
    end

    assert_redirected_to beer_path(assigns(:beer))
  end

  test "should show beer" do
    get :show, :id => beers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => beers(:one).to_param
    assert_response :success
  end

  test "should update beer" do
    put :update, :id => beers(:one).to_param, :beer => { }
    assert_redirected_to beer_path(assigns(:beer))
  end

  test "should destroy beer" do
    assert_difference('Beer.count', -1) do
      delete :destroy, :id => beers(:one).to_param
    end

    assert_redirected_to beers_path
  end
end
