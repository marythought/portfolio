require "test_helper"

feature "Projects::DeletingAProject" do
  scenario "can delete a project" do
    sign_in
    number_of_projects = Project.all.count
    visit projects_path
    click_link('New Project')
    fill_in 'Name', with: "Zillow"
    fill_in "Technologies used", with: projects(:one).technologies_used
    fill_in "Image url", with: projects(:one).image_url
    click_button('Create Project')
    click_on "Back"
    page.find("#portfolio ul li:last").click_on "Destroy"
    page.text.must_include "Project was successfully destroyed"
    page.text.wont_include "Zillow"
  end
end
