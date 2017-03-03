Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true

  config.i18n.available_locales = ["pt-BR", :en]

  config.action_mailer.delivery_method = :letter_opener
end
