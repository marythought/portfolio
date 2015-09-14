require "test_helper"

feature "Authentication::CanLogOut" do
  scenario "with an author account" do
    sign_in(:editor)


    # this is a controller test or functional test
    # when hack params http://localhost:3000/users/edit
    # put to users/
    # then: editor account
  end
end

"""
test 'should create article' do
  assert_difference('Article.count') do
    post :create, article: {title: 'Hi', body: 'This is my first article.'}
  end
  assert_redirected_to article_path(assigns(:article))
  assert_equal 'Article was successfully created.', flash[:notice]
end
"""
