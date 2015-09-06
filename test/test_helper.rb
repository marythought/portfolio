Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# class FeatureSpec < MiniTest::Spec
#   require "capybara/poltergeist"
#   include Capybara::DSL
#   Capybara.register_driver :poltergeist do |config|
#     Capybara::Poltergeist::Driver.new(config, {js_errors: false,
#                                                timeout: 1000})
#   end
#   Capybara.default_driver = :poltergeist
#   register_spec_type(/page$/, self)
# end

require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
