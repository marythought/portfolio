class ProjectPolicy < ApplicationPolicy
  attr_accessor :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    @user.admin?
  end
end
