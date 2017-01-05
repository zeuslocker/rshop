require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rshop
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

  end
end
