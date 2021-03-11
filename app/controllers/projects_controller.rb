class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
