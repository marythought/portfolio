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
end
