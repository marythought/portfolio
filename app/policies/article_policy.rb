class ArticlePolicy < ApplicationPolicy
  def publish?
    @user.admin?
  end

  def create?
    @user.admin? || @user.author?
  end

  def destroy?
    @user.admin?
  end

  def update?
    @user.admin? || @user.author?
  end

  # ArticlePolicy::Scope.new
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all # default 'scope' is whatever its initialized with, eg Article.all
      elsif user.author?
        scope.where(user: user)
      else
        scope.where(published: true)
      end
    end
  end
end


