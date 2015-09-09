require "test_helper"

feature "Projects::EditingAProject" do
  scenario "with valid content" do
    project = Project.new(name: "my project", technologies_used: "ruby")
    visit project_path(project.id)
    fill_in "Name", with: "New project name"
    fill_in "Technologies used", with: "New technology"
    click_button "Update Project"
    page.text.must_include "Success"
    page.must_have_content "New project name"
    page.wont_have_content "my project"
  end
end
