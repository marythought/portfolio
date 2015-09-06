require "test_helper"

feature "CheckForZurbTest" do
  scenario "has zurb content" do
    visit root_path
    page.has_css?('large-8 columns')
  end
end
