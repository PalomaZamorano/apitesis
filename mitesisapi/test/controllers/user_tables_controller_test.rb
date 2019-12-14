require 'test_helper'

class UserTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_table = user_tables(:one)
  end

  test "should get index" do
    get user_tables_url, as: :json
    assert_response :success
  end

  test "should create user_table" do
    assert_difference('UserTable.count') do
      post user_tables_url, params: { user_table: { user_cargo: @user_table.user_cargo, user_mail: @user_table.user_mail, user_name: @user_table.user_name, user_rol: @user_table.user_rol } }, as: :json
    end

    assert_response 201
  end

  test "should show user_table" do
    get user_table_url(@user_table), as: :json
    assert_response :success
  end

  test "should update user_table" do
    patch user_table_url(@user_table), params: { user_table: { user_cargo: @user_table.user_cargo, user_mail: @user_table.user_mail, user_name: @user_table.user_name, user_rol: @user_table.user_rol } }, as: :json
    assert_response 200
  end

  test "should destroy user_table" do
    assert_difference('UserTable.count', -1) do
      delete user_table_url(@user_table), as: :json
    end

    assert_response 204
  end
end
