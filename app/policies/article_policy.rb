class ArticlePolicy < ApplicationPolicy
  def publish?
    @user.editor?
  end

  def create?
    @user.editor? || @user.author?
  end

  def destroy?
    @user.editor?
  end

  def update?
    @user.editor? || @user.author?
  end

  # ArticlePolicy::Scope.new
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all # default 'scope' is whatever its initialized with, eg Article.all
      elsif user.author?
        scope.where(user: user)
      else
        scope.where(published: true)
      end
    end
  end
end


