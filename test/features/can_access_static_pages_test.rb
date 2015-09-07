require "test_helper"

feature "CanAccessStaticPages" do
  scenario "on the index page" do
    visit root_path
    page.must_have_content "Mary Dickson Diaz"
    page.wont_have_content "Goodbye All!"
  end

  scenario "on a custom domain" do
    visit("http://www.marydickson.info")
    page.must_have_content("Mary Dickson Diaz")
    # This is passing but it also passes with inaccurate content
    # So I think it's broken.
    # But I don't know why :-(
  end
end
