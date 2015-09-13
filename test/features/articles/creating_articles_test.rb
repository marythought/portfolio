require "test_helper"

feature "Articles::CreatingArticles" do

  scenario "user can create a new blog post from index" do
    sign_in(:author)
    page.text.must_include "Signed in successfully."
    visit blogs_path
    click_link('New Blog Post')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    click_button('Create Blog')
    page.must_have_content "This is a new title"
    page.text.must_include "Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_blog_path" do
    visit new_blog_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new blog button" do
    # When I visit the blog index page
    visit blogs_path
    # Then I should not see the "New Article" button
    page.wont_have_link "New Blog"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_blog_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_blog_path

    # There is a checkbox for published
    page.must_have_field('blog[published]')

    # When I submit the form
    fill_in "Title", with: blogs(:unpublished).title
    fill_in "Body", with: blogs(:unpublished).body
    check "Published"
    click_on "Create Blog"

    # Then the published blog should be shown
    page.text.must_include "Status: Published"
  end
end
