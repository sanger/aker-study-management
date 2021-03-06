require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projects
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: true

      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.assets false
    end

    config.ldap = config_for(:ldap)

    config.autoload_paths += %W["#{config.root}/app/forms"]

    # http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html
    config.time_zone = 'London'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.ubw = {
      enabled: true
    }
  end
end
