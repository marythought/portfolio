require "test_helper"

feature "Projects::DeletingAProject" do
  scenario "can delete a project" do
    number_of_projects = Project.all.count
    visit projects_path
    page.find("tbody tr:last").click_on "Destroy"
    assert_equal Project.all.count, number_of_projects - 1
  end
end
