require 'test_helper'

class ExpenseControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get expense_new_url
    assert_response :success
  end

  test 'should get create' do
    get expense_create_url
    assert_response :success
  end

  test 'should get index' do
    get expense_index_url
    assert_response :success
  end

  test 'should get update' do
    get expense_update_url
    assert_response :success
  end

  test 'should get edit' do
    get expense_edit_url
    assert_response :success
  end

  test 'should get show' do
    get expense_show_url
    assert_response :success
  end

  test 'should get destrol' do
    get expense_destrol_url
    assert_response :success
  end
end