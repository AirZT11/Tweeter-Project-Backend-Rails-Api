# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# host for Heroku domain
config.action_mailer.default_url_options = { :host => 'https://tweeter-heroku-backend.herokuapp.com/' }
