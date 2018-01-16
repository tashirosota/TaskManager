require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ex
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
 #   Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "images")
#Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "stylesheets")
#Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "javascripts")
    # -- all .rb files in that directory are automatically loaded.
  end
end

