require "test_helper"

feature "Projects::ShowingProjectIndex" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include projects(:one).name
    page.text.must_include projects(:two).name
  end
end
