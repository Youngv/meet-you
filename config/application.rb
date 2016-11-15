require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require "token_authorizer"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MeetYou
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = 'zh-CN'
    config.i18n.available_locales = ['zh-CN', :en]
    config.time_zone = 'Beijing'
    config.middleware.use TokenAuthorizer, Logger.new(STDOUT) do |email, password, auth_token|
      if email && password
        user = User.find_by_email(email)
        authorized = true if user && user.authenticate(password)
      else
        user = User.find_by_auth_token(auth_token)
        authorized = true if user
      end
      [user, authorized]
    end
  end
end
