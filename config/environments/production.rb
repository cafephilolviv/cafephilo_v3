Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = true
  config.assets.digest = true
  config.active_storage.service = :local

  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'service.cafephilo.lviv.ua',
    port:                 587,
    domain:               'cafephilo.lviv.ua',
    user_name:            ENV['CAFEPHILO_V3_PRODUCTION_MAIL_USERNAME'],
    password:             ENV['CAFEPHILO_V3_PRODUCTION_MAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = {
    host: ENV['CAFEPHILO_V3_PRODUCTION_HOST']
  }
  config.action_mailer.default_options = {
    from: ENV['CAFEPHILO_V3_PRODUCTION_MAIL_USERNAME']
  }

  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
  end
end
