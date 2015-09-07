require "test_helper"

feature "CanAccessStaticPages" do
  scenario "on the index page" do
    visit root_path
    page.must_have_content "Mary Dickson Diaz"
    page.wont_have_content "Goodbye All!"
  end
end
