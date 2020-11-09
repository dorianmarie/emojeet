require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "only accepts emojis as content" do
    assert_content_not_valid("a")
    assert_content_not_valid("a🚀")
    assert_content_valid("🚀")
    assert_content_valid("🚀🍗")
  end

  def assert_content_not_valid(content)
    message = Message.new(content: content, user: users(:one))
    assert_not message.valid?, message.full_error_messages
  end

  def assert_content_valid(content)
    message = Message.new(content: content, user: users(:one))
    assert message.valid?, message.full_error_messages
  end
end
