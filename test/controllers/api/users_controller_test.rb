require "test_helper"

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  context "#create" do
    should "register" do
      post api_users_path, params: { user: { name: "🎉🍗", password: "password" } }
      assert_response :success
    end

    should "not register with a taken username" do
      post api_users_path, params: { user: { name: "🎉", password: "password" } }
      assert_response :bad_request
    end
  end

  context "#show" do
    should "return an user" do
      get api_user_path("🎉")
      assert_response :success
      assert_equal "🎉", json_response["name"]
    end

    should "not return an user when not found" do
      get api_user_path("🎉🚀")
      assert_response :not_found
    end
  end

  context "#current" do
    should "return the current user when logged in" do
      post api_users_path, params: { user: { name: "🎉🍗", password: "password" } }
      get current_api_users_path
      assert_response :success
      assert_equal "🎉🍗", json_response["name"]
    end

    should "not return any user when logged out" do
      get current_api_users_path
      assert_response :success
      assert_nil json_response
    end
  end
end
