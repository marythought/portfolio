require "test_helper"

feature "VisitingTheBlogIndex" do


  scenario "blog index contains blog posts" do
    visit blogs_path
    page.must_have_content "Blog Posts"
  end

  scenario "user can create a new blog post from index" do
    signin
    page.text.must_include "Signed in successfully."
    visit blogs_path
    click_link('New Blog Post')
    fill_in "Title", with: blogs(:cr).title
    fill_in "Body", with: blogs(:cr).body
    click_button('Create Blog')
    page.must_have_content blogs(:cr).title
  end

  scenario "user can edit an existing blog post" do
    signin
    blog = blogs(:cr)
    visit blog_path(blog.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Blog"
    page.must_have_content "New edit title"
    page.wont_have_content blogs(:cr).body
  end

  scenario "user can delete a blog post" do
    signin
    Blog.create(title: "Becoming a Fode Cellow", body: "Means striving.")
    number_of_blogs = Blog.all.count
    visit blogs_path
    page.find("tbody tr:last").click_on "Destroy"
    page.wont_have_content "Fode Cellow"
    assert_equal Blog.all.count, number_of_blogs - 1
  end

  scenario "articles display author" do
    blog = blogs(:cr)
    visit blog_path(blog.id)
    page.has_css? "#author"
    page.text.must_include users(:cassie).name # Use your fixture name here.
  end
end
