require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CafephiloV3
  class Application < Rails::Application
    config.load_defaults 6.0

    config.active_job.queue_adapter = :sidekiq
    config.generators.system_tests = nil

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.i18n.available_locales = %i[uk en]
    config.to_prepare do
      # Configure single controller layout
      Devise::SessionsController.layout 'admin'
      Devise::PasswordsController.layout 'admin'
    end

    # config.i18n.enforce_available_locales = false
    Raven.configure do |config|
      config.dsn = ENV['SENTRY_DSN']
      config.environments = %w[staging production]
    end
  end
end
