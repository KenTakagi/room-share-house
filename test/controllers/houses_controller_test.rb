require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { address: @house.address, bicycle_space: @house.bicycle_space, bike_space: @house.bike_space, capacity: @house.capacity, car_space: @house.car_space, is_pet: @house.is_pet, name: @house.name, owner_id: @house.owner_id, telphone: @house.telphone, zipcode: @house.zipcode }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    patch :update, id: @house, house: { address: @house.address, bicycle_space: @house.bicycle_space, bike_space: @house.bike_space, capacity: @house.capacity, car_space: @house.car_space, is_pet: @house.is_pet, name: @house.name, owner_id: @house.owner_id, telphone: @house.telphone, zipcode: @house.zipcode }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
