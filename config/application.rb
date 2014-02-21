require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module AttitudeSurvey
  class Application < Rails::Application

    config.assets.paths << "#{Rails}/app/assets/fonts"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # links to external referrer (i.e. ResearchNow)
    config.referrer_complete_link = "http://redirects.researchnow.com/44217870redirect.asp?status=1&subsid="
    config.referrer_screenout_link = "http://redirects.researchnow.com/44217870redirect.asp?status=2&subsid="
    config.referrer_quotafull_link = "http://redirects.researchnow.com/44217870redirect.asp?status=3&subsid="
    
    # number of responses to allow from external referrer
    config.referrer_quota = 300

  end
end
