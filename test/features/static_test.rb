require "test_helper"

feature "Static page" do
  scenario "index page" do
    visit root_path
    page.must_have_content "Mary Dickson Diaz"
    page.wont_have_content "Goodbye All!"
  end
end
