require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Emojeet
  class Application < Rails::Application
    config.load_defaults 6.0
    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE")
  end
end
