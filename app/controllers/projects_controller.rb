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
    if @project.save
      # flash[:notice] = "Project has been successfully created."
      # render :show
    else
      flash[:notice] = "Project could not be saved"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      # flash[:notice] = 'Project was successfully updated.'
      # redirect_to @project
    else
      # flash[:notice] = "Project could not be updated"
      render :edit
    end
  end

  def destroy
    @project.destroy
    # flash[:notice] = 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :technologies_used, :url, :image_url, :writeup, :github)
  end
end
