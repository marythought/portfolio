require "test_helper"

feature "VisitingTheBlogIndex" do
  scenario "blog index contains blog posts" do
    visit blogs_path
    page.must_have_content "Listing Blogs"
  end

  scenario "with existing posts" do
    # Given existing posts
    Blog.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    # When I visit /posts
    visit blogs_path
    # Then the existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end

  scenario "visitor can create a new blog post from index" do
    visit blogs_path
    click_link('New Blog')
    fill_in "Title", with: 'Let\'s make a new post'
    fill_in "Body", with: 'Here is some blog content goodness.'
    click_button "Create Blog"
    page.must_have_content 'Let\'s make a new post'
  end

  scenario "visitor can edit an existing blog post" do
    blog = Blog.create(title: "Becoming a Fode Cellow", body: "Means striving for excellence.")
    visit blog_path(blog.id)
    click_link('Edit')
    fill_in "Title", with: "Becoming a Code Fellow"
    fill_in "Body", with: "Means striving for excellence."
    click_button "Update Blog"
    page.must_have_content 'Becoming a Code Fellow'
    page.wont_have_content 'Becoming a Fode Cellow'
  end

  scenario "visitor can delete a blog post" do
    blog = Blog.create(title: "Becoming a Fode Cellow", body: "Means striving for excellence.")
    number_of_blogs = Blog.all.count
    visit blogs_path
    click_link('Destroy')
    assert_equal Blog.all.count, number_of_blogs - 1
  end
end

