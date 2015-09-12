module BlogsHelper

  def username(blog)
    User.find(blog.user_id).name
  end

end
