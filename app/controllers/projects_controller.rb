class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    render :new unless @project.save
    respond_to do |format|
      format.html { redirect_to action: 'index' }
    end
  end

  def show; end

  def edit; end

  def update
    render :edit unless @project.update_attributes(project_params)
    respond_to do |format|
      format.html { redirect_to action: 'index' }
    end
  end

  def destroy
    @project.destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    # rubocop:disable LineLength
    params.require(:project).permit(:name, :description, :technologies_used, :url, :image_url, :image, :writeup, :github)
    # rubocop:enable LineLength
  end
end
