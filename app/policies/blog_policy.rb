class BlogPolicy
  attr_accessor :user, :BlogPolicy

  def initialize(user, blog)
    @user = user
    @blog = blog
  end

  def publish?
    @user.role == "editor"
  end
end
