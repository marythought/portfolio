require "test_helper"

class CanAccessCustomDomainTest < Capybara::Rails::TestCase
  test "sanity" do
    visit "http://www.marydickson.info"
    assert_content page, "Mary Dickson"
    refute_content page, "crack cocaine"
  end
end
