require "test_helper"

class ExpenseCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get expense_category_new_url
    assert_response :success
  end

  test "should get crate" do
    get expense_category_crate_url
    assert_response :success
  end

  test "should get update" do
    get expense_category_update_url
    assert_response :success
  end

  test "should get edit" do
    get expense_category_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get expense_category_destroy_url
    assert_response :success
  end

  test "should get index" do
    get expense_category_index_url
    assert_response :success
  end

  test "should get show" do
    get expense_category_show_url
    assert_response :success
  end
end
