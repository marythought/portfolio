require "test_helper"

feature "Projects::EditingAProject" do
  scenario "with valid content" do
    sign_in
    project = projects(:one)
    visit project_path(project.id)
    click_link('Edit')
    fill_in "Name", with: "New project name"
    fill_in "Technologies used", with: "New technology"
    click_button "Update Project"
    page.text.must_include "successfully updated"
    page.must_have_content "New project name"
    page.wont_have_content projects(:one).name
  end

  scenario "with invalid content" do
    sign_in
    project = projects(:two)
    visit project_path(project.id)
    click_link('Edit')
    fill_in "Name", with: ""
    click_button "Update Project"
    page.text.must_include "Project could not be updated"
  end
end
