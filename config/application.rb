require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

require_relative "../lib/env_variables"
EnvVariables.load_variables('.env')

require_relative "../lib/app_config"
AppConfig = SetupConfig.setup(Rails.env)

module LittleWeb
  class Application < Rails::Application
    config.autoload_paths += %W(
      #{config.root}/lib
    )

    config.encoding = "utf-8"
    config.filter_parameters += %w{
      password
    }
    
    config.active_support.escape_html_entities_in_json = true
    
    # Need to get assets working on Heroku
    config.assets.initialize_on_precompile = false
    config.assets.enabled = true
    config.assets.version = '1.0'    
    config.assets.precompile += %W(
      app.js
      app_start.js
    )
  end
end
