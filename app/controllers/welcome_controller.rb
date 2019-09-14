class WelcomeController < ApplicationController
  def index
    @props = { admin: current_user.try(:admin?) }
  end

  def about; end

  def resume; end

  def blog; end

  def news; end
end
