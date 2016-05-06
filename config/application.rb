require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sanpedrovalleyjobs
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.i18n.default_locale = "pt-BR"

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_mailer.smtp_settings = {
      address: ENV["MAILGUN_SMTP_SERVER"],
      port: 587,
      domain: ENV["MAILGUN_DOMAIN"],
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV["MAILGUN_SMTP_LOGIN"],
      password: ENV["MAILGUN_SMTP_PASSWORD"]
    }

    config.action_mailer.delivery_method = :smtp

    config.action_mailer.default_url_options = {
      host: ENV["DOMAIN_NAME"]
    }
  end
end
