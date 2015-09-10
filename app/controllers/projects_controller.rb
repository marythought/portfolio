class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been successfully created."
      redirect_to @project
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
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      flash[:notice] = "Project could not be updated"
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image_url)
  end
end
