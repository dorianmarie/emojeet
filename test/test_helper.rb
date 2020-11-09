ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)

  fixtures :all

  def login(user: users(:one))
    post api_session_path, params: { session: { name: user.name, password: "password" } }
    assert_response :success
  end

  def json_response
    JSON.parse(response.body)
  end
end
