require "test_helper"

feature "VisitingTheBlogIndex" do
  scenario "blog index contains blog posts" do
    visit blogs_path
    page.must_have_content "Listing Blogs"
  end

  scenario "visitor can create a new blog post from index" do
    visit blogs_path
    click_link('New Blog')
    page.must_have_content 'Title' #this isn't necessarily redirecting?
  end

  scenario "visitor can edit an existing blog post" do
    visit_blogs_path(blog)
    click('Edit')
    expect redirect_to blogs_edit_path(blog_id)
  end

  scenario "visitor can delete a blog post" do
    visit '/blogs/index'
    click('Destroy')
  end
end
