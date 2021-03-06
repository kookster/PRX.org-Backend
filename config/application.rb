require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)


module PRX
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    I18n.config.enforce_available_locales = true
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :en

    config.autoload_paths += %W( #{config.root}/app/representers/concerns )

    # Disable the asset pipeline.
    config.assets.enabled = false

    config.generators do |g|
      g.test_framework :mini_test, spec: true, fixture: false
    end

    config.middleware.insert_before Rack::Sendfile, Rack::Cors do
      allow do
        origins '*'
        resource '/api/*', methods: [:get]
      end
    end
  end
end
