require "test_helper"

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  context "#create" do
    should "login with correct credentials" do
      post api_session_path, params: { session: { name: "🎉", password: "password" } }
      assert_response :success
      get current_api_users_path
      assert_response :success
    end

    should "not login with incorrect credentials" do
      post api_session_path, params: { session: { name: "🎉", password: "wrong password" } }
      assert_response :bad_request
      get current_api_users_path
      assert_response :bad_request
    end
  end

  context "#destroy" do
    should "logout" do
      post api_session_path, params: { session: { name: "🎉", password: "password" } }
      assert_response :success
      get current_api_users_path
      assert_response :success
      delete api_session_path
      assert_response :success
      get current_api_users_path
      assert_response :bad_request
    end
  end
end
