require "test_helper"

feature "Articles::EditingArticles" do
  scenario "As an author, I want to update articles so that I can fix typos." do
    sign_in(:author)
    article = articles(:unpublished)
    visit article_path(article.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Article"
    page.must_have_content "New edit title"
    page.wont_have_content articles(:published).body
  end

  scenario "editors can update articles" do
    sign_in(:editor)
    article = articles(:unpublished)
    visit article_path(article.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Article"
    page.must_have_content "New edit title"
    page.wont_have_content articles(:published).body
  end

  scenario "users can't update articles" do
    article = articles(:published)
    visit article_path(article.id)
    page.wont_have_link "Edit"
  end
end
