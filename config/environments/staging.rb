Rails.application.configure do
  # Code is not reloaded between requests.
  config.cache_classes = true

  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  config.active_storage.service = :local

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

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
  
  config.public_file_server.enabled = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'service.cafephilo.lviv.ua',
    port:                 587,
    domain:               'cafephilo.lviv.ua',
    user_name:            ENV['CAFEPHILO_V3_STAGING_MAIL_USERNAME'],
    password:             ENV['CAFEPHILO_V3_STAGING_MAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = { host: 'staging.cafephilo.lviv.ua' }
  config.action_mailer.default_options = { from: 'staging@cafephilo.lviv.ua' }
end
