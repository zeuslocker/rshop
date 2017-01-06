Rails.application.configure do

  config.cache_classes = true
  config.cache_store = :dalli_store
  config.eager_load = true
  config.consider_all_requests_local = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new


  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
