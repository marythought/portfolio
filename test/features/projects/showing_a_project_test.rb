require "test_helper"

feature "Projects::ShowingAProject" do
  scenario "visiting a single project" do
    visit project_path(projects(:one).id)
    page.must_have_content projects(:one).name
  end
end
