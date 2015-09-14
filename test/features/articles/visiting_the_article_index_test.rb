require "test_helper"

feature "VisitingTheArticleIndex" do
  scenario "public article index contains only published article posts" do
    visit articles_path
    page.text.wont_include "Unpublished"
  end

  scenario "articles display author" do
    article = articles(:published)
    visit article_path(article.id)
    page.has_css? "#author"
    page.text.must_include users(:cassie).name
  end

  scenario "author see their own articles but editors see all posts" do
    sign_in(:editor)
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    click_button('Create Article')
    click_link('Log out')
    sign_in(:author)
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    click_button('Create Article')
    visit articles_path
    page.text.must_include users(:author).name
    page.text.wont_include users(:editor).name
    click_link('Log out')
    sign_in(:editor)
    visit articles_path
    page.text.must_include users(:author).name
    page.text.must_include users(:editor).name
  end
end
