require "test_helper"

feature "VisitingTheBlogIndex" do

  scenario "blog index contains blog posts" do
    visit blogs_path
    page.must_have_content "Blog Posts"
  end

  scenario "author can edit an existing blog post" do
    sign_in(:author)
    blog = blogs(:published)
    visit blog_path(blog.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Blog"
    page.must_have_content "New edit title"
    page.wont_have_content blogs(:published).body
  end

  scenario "user can delete a blog post" do
    sign_in(:cassie)
    Blog.create(title: "Becoming a Fode Cellow", body: "Means striving.")
    number_of_blogs = Blog.all.count
    visit blogs_path
    page.find("tbody tr:last").click_on "Destroy"
    page.wont_have_content "Fode Cellow"
    assert_equal Blog.all.count, number_of_blogs - 1
  end

  scenario "articles display author" do
    blog = blogs(:published)
    visit blog_path(blog.id)
    page.has_css? "#author"
    page.text.must_include users(:cassie).name # Use your fixture name here.
  end
end
