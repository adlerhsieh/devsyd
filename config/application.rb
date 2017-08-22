require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Devsyd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Sprockets 4 settings
    config.assets.precompile = ["manifest.js"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.default_timezone = :local
    config.time_zone = 'Asia/Taipei'
    
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl
    end
  end
end
