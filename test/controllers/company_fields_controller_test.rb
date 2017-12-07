require 'test_helper'

class CompanyFieldsControllerTest < ActionController::TestCase
  setup do
    @company_field = company_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_field" do
    assert_difference('CompanyField.count') do
      post :create, company_field: { name: @company_field.name }
    end

    assert_redirected_to company_field_path(assigns(:company_field))
  end

  test "should show company_field" do
    get :show, id: @company_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_field
    assert_response :success
  end

  test "should update company_field" do
    patch :update, id: @company_field, company_field: { name: @company_field.name }
    assert_redirected_to company_field_path(assigns(:company_field))
  end

  test "should destroy company_field" do
    assert_difference('CompanyField.count', -1) do
      delete :destroy, id: @company_field
    end

    assert_redirected_to company_fields_path
  end
end
