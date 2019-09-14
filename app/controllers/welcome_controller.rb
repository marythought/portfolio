class WelcomeController < ApplicationController
  def index
    @props = { commonplaces: Commonplace.all }
  end

  def about; end

  def resume; end

  def blog; end

  def news; end
end
