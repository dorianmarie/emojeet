require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "only accepts emojis as names" do
    assert_name_not_valid("a")
    assert_name_not_valid("a🚀")
    assert_name_valid("🚀")
    assert_name_valid("🚀🍗")
  end

  def assert_name_not_valid(name)
    user = User.new(name: name, password: "a")
    assert_not user.valid?, user.full_error_messages
  end

  def assert_name_valid(name)
    user = User.new(name: name, password: "a")
    assert user.valid?, user.full_error_messages
  end
end
