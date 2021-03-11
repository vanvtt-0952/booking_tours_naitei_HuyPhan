require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BookTours
  class Application < Rails::Application
    config.load_defaults 6.0

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.default_locale = :vi
    I18n.available_locales = [:en, :vi]

  end
end
