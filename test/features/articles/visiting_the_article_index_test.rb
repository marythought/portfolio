require "test_helper"

feature "VisitingTheArticleIndex" do
  scenario "article index contains article posts" do
    visit articles_path
    page.must_have_content "Articles"
  end

  scenario "author can edit an existing article post" do
    sign_in(:author)
    article = articles(:published)
    visit article_path(article.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Article"
    page.must_have_content "New edit title"
    page.wont_have_content articles(:published).body
  end

  scenario "user can delete a article post" do
    sign_in(:cassie)
    Article.create(title: "Becoming a Fode Cellow", body: "Means striving.")
    number_of_articles = Article.all.count
    visit articles_path
    page.find("tbody tr:last").click_on "Destroy"
    page.wont_have_content "Fode Cellow"
    assert_equal Article.all.count, number_of_articles - 1
  end

  scenario "articles display author" do
    article = articles(:published)
    visit article_path(article.id)
    page.has_css? "#author"
    page.text.must_include users(:cassie).name # Use your fixture name here.
  end
end
