require "test_helper"

feature "Static" do
  scenario "index page returns content" do
    visit root_path
    page.must_have_content "Mary Dickson Diaz"
    page.wont_have_content "Goodbye All!"
  end
end
