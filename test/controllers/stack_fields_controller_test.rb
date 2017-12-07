require 'test_helper'

class StackFieldsControllerTest < ActionController::TestCase
  setup do
    @stack_field = stack_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stack_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stack_field" do
    assert_difference('StackField.count') do
      post :create, stack_field: { name: @stack_field.name }
    end

    assert_redirected_to stack_field_path(assigns(:stack_field))
  end

  test "should show stack_field" do
    get :show, id: @stack_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stack_field
    assert_response :success
  end

  test "should update stack_field" do
    patch :update, id: @stack_field, stack_field: { name: @stack_field.name }
    assert_redirected_to stack_field_path(assigns(:stack_field))
  end

  test "should destroy stack_field" do
    assert_difference('StackField.count', -1) do
      delete :destroy, id: @stack_field
    end

    assert_redirected_to stack_fields_path
  end
end
