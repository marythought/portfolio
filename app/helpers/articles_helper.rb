module ArticlesHelper
  def username(article)
    User.find(article.user_id).name
  end

  def shorten(text)
    text[0,100]
  end
end
