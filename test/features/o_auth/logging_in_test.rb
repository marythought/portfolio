require "test_helper"

feature "OAuth::LoggingIn" do
  scenario "user can log in using twitter" do
    visit root_path
    click_link('Log in with Twitter')
    # some stuff should happen to grant authorization...
    page.text.must_include "Signed in successfully."

  end
end
