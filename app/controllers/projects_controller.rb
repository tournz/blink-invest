class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if params[:query].present?
      @projects = Project.search_by_name_location_description(params[:query])
    else
      @projects = Project.all
    end
    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { project: project })
      }
    end
  end

  def show
    @project = Project.find(params[:id])
    @users = @project.users.distinct
    @pie_data = ChartkickMethods.pie_chart_method(@users, @project)
  end
end
