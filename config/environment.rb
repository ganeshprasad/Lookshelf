# Load the rails application
require File.expand_path('../application', __FILE__)

RPXNow.api_key = ENV['59231eb225651b0eabb453aed4c0f715eeec3163']

# Initialize the rails application
Lookshelf::Application.initialize!
