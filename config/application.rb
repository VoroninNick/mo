require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MO
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

    config.i18n.default_locale = :uk
    config.i18n.enforce_available_locales = false
    config.i18n.fallbacks = true
    config.i18n.available_locales = [:uk, :pl, :en]
    config.i18n.locale ||= config.i18n.default_locale

    Globalize.fallbacks = {:uk => [:uk, :pl], :pl => [:pl, :uk] }

    # precompile
    config.assets.precompile += %w(rails_admin/aristo/images/*.png rails_admin/aristo/images/*.jpg rails_admin/aristo/images/*.png rails_admin/aristo/images/*.jpeg)
  end
end
