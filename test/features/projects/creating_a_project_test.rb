require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "create a new project" do
    visit projects_path
    click_link('New Project')
    fill_in 'Title', with: "My title"
    fill_in "Technologies used", with: "Ruby on Rails"
    click_button('Create Project')
    page.must_have_content projects(:project1).title
  end
end
