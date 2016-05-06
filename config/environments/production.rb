Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV["RAILS_SERVE_STATIC_FILES"].present?

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.log_level = :debug

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false

  config.log_formatter = ::Logger::Formatter.new

  config.i18n.available_locales = ["pt-BR", :en]

  config.active_record.dump_schema_after_migration = false
end
