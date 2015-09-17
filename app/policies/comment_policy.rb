class CommentPolicy < ApplicationPolicy
  def publish?
    @user.editor?
  end

  def destroy?
    @user.editor?
  end

  def update?
    @user.editor? || @record.user == user
  end

  # ArticlePolicy::Scope.new
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all # default 'scope' is whatever its initialized with, eg Article.all
      else
        scope.where(published: true)
      end
    end
  end
end
