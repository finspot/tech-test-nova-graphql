# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_record/railtie'
require 'action_controller/railtie'

Bundler.require(*Rails.groups)

module Starter
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
    config.eager_load_paths << Rails.root.join('app/graphql')
  end
end
