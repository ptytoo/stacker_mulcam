# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'omniauth-facebook'

# Initialize the Rails application.
Rails.application.initialize! :strategy_class
