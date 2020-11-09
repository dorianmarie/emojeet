require "test_helper"

class Api::MessagesControllerTest < ActionDispatch::IntegrationTest
  context "#index" do
    should "return a message" do
      get api_messages_path
      assert_response :success
      assert_equal messages(:one).content, json_response["messages"][0]["content"]
    end
  end

  context "#show" do
    should "return a message" do
      get api_message_path(messages(:one))
      assert_response :success
      assert_equal messages(:one).content, json_response["content"]
    end
  end

  context "#create" do
    should "create a message when logged in" do
      login
      post api_messages_path, params: { message: { content: "🎉🚀" } }
      assert_response :success
      assert_equal "🎉🚀", Message.last.content
    end

    should "not allow visitors" do
      post api_messages_path, params: { message: { content: "🎉🚀" } }
      assert_response :bad_request
    end
  end
end
