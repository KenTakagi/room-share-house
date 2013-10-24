require 'test_helper'

class RailCompaniesControllerTest < ActionController::TestCase
  setup do
    @rail_company = rail_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rail_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rail_company" do
    assert_difference('RailCompany.count') do
      post :create, rail_company: { name: @rail_company.name, rr_id: @rail_company.rr_id, sort: @rail_company.sort, status: @rail_company.status, type: @rail_company.type, url: @rail_company.url }
    end

    assert_redirected_to rail_company_path(assigns(:rail_company))
  end

  test "should show rail_company" do
    get :show, id: @rail_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rail_company
    assert_response :success
  end

  test "should update rail_company" do
    patch :update, id: @rail_company, rail_company: { name: @rail_company.name, rr_id: @rail_company.rr_id, sort: @rail_company.sort, status: @rail_company.status, type: @rail_company.type, url: @rail_company.url }
    assert_redirected_to rail_company_path(assigns(:rail_company))
  end

  test "should destroy rail_company" do
    assert_difference('RailCompany.count', -1) do
      delete :destroy, id: @rail_company
    end

    assert_redirected_to rail_companies_path
  end
end
