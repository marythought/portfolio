require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "create a new project" do
    visit projects_path
    click_link('New Project')
    fill_in 'Name', with: "My title"
    fill_in "Technologies used", with: "Ruby on Rails"
    click_button('Create Project')
    page.text.must_include "Project has been successfully created"
    assert page.has_css?(".alert-box"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end

  scenario "when a project is submitted with invalid info" do
    visit projects_path
    click_link('New Project')
    fill_in 'Name', with: ""
    fill_in 'Technologies used', with: ""
    click_button('Create Project')
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name can't be blank"
    page.text.must_include "Technologies used can't be blank"
  end
end
