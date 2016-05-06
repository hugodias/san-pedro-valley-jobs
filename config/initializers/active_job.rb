ActiveJob::Base.queue_adapter = Rails.env.test? ? :inline : :sidekiq
