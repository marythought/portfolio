require "test_helper"

feature "Comments::CreatingComments" do
  scenario "visitors can submit blog comments" do
    sign_in(:Mary)
    article = articles(:published)
    visit article_path(article.id)
    click_link("New comment")
    fill_in "Content", with: comments(:one).content
    click_button('Create Comment')
    page.text.must_include "pending admin approval"
    # something that shows author = current_user ?
  end

  scenario "editors can approve blog comments" do
    sign_in(:editor)
    article = articles(:published)
    comment = comments(:one)
    visit edit_article_comment_path(article.id, comment.id)
    # click_link("Editors, edit or approve comments")
    # page.text.must_include "Pending Approval"
    # click_link("Edit")
    check "Published"
    click_on "Update Comment"
    page.text.must_include "Updated comment."
  end
end


# As a site visitor I want to write a comment on a blog article page so that I can troll the author.
# As an editor I want to approve comments so that my blog does not have spam comments.
