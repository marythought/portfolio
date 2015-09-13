require "test_helper"

feature "Articles::CreatingArticles" do
  scenario "user can create a new article post from index" do
    sign_in(:author)
    page.text.must_include "Signed in successfully."
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    click_button('Create Article')
    page.must_have_content "This is a new title"
    page.text.must_include "Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_article_path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new article button" do
    # When I visit the article index page
    visit articles_path
    # Then I should not see the "New Article" button
    page.wont_have_link "New Article"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_article_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_article_path

    # There is a checkbox for published
    page.must_have_field('article[published]')

    # When I submit the form
    fill_in "Title", with: articles(:unpublished).title
    fill_in "Body", with: articles(:unpublished).body
    check "Published"
    click_on "Create Article"

    # Then the published article should be shown
    page.text.must_include "Status: Published"
  end
end
