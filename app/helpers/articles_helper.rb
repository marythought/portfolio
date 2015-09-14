module ArticlesHelper
  def username(article)
    User.find(article.user_id).name
  end
end
