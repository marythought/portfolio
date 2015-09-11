Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest/reporters"

Minitest::Reporters.use! # Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end

system 'rubocop'

def signin
  visit root_path
  click_link('Log in')
  fill_in 'Email', with: users(:cassie).email
  fill_in 'Password', with: 'password'
  click_button('Log in')
end
