class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if params[:query].present?
      @projects = Project.search_by_name_location_description(params[:query])
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
