require File.expand_path('../boot', __FILE__)
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Myapp
    class Application < Rails::Application
        config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
        Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
            Rails.application.config.assets.paths << path
        end
    end
end
