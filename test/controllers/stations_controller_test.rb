require 'test_helper'

class StationsControllerTest < ActionController::TestCase
  setup do
    @station = stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station" do
    assert_difference('Station.count') do
      post :create, station: { cd: @station.cd, display_flg: @station.display_flg, lat: @station.lat, line_cd: @station.line_cd, line_sort: @station.line_sort, lon: @station.lon, name: @station.name, pref_cd: @station.pref_cd, rail_campany_cd: @station.rail_campany_cd, station_g_cd: @station.station_g_cd, station_type: @station.station_type }
    end

    assert_redirected_to station_path(assigns(:station))
  end

  test "should show station" do
    get :show, id: @station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station
    assert_response :success
  end

  test "should update station" do
    patch :update, id: @station, station: { cd: @station.cd, display_flg: @station.display_flg, lat: @station.lat, line_cd: @station.line_cd, line_sort: @station.line_sort, lon: @station.lon, name: @station.name, pref_cd: @station.pref_cd, rail_campany_cd: @station.rail_campany_cd, station_g_cd: @station.station_g_cd, station_type: @station.station_type }
    assert_redirected_to station_path(assigns(:station))
  end

  test "should destroy station" do
    assert_difference('Station.count', -1) do
      delete :destroy, id: @station
    end

    assert_redirected_to stations_path
  end
end
