class SubscriptionsController < ApplicationController
  before_action :set_project, only: %i[new create]
  before_action :set_user, only: :create

  def new
    @subscription = Subscription.new
    @max_amount = @project.subscriptions.sum(&:amount)
    @users = @project.users.distinct

    # Piechart data
    @pie_data = []
    total_funded = 0
    @users.each do |user|
      user_project_amount = user.subscriptions.where(project: @project).sum(&:amount)
      user_percentage = 100 * user_project_amount / @project.amount
      user_percentage = user_percentage.round(0)
      total_funded += user_percentage
      @pie_data << [user.name, user_percentage]
    end
    total_funded -= 100
    @pie_data << ["Not funded", total_funded.abs]
  end
    # Piechart data end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.project = @project
    @subscription.user = @user
    @users = @project.users.distinct
    @max_amount = @project.subscriptions.sum(&:amount)
    if @subscription.save
      redirect_to portfolio_path
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user
    @user = current_user
  end

  def subscription_params
    params.require(:subscription).permit(:amount)
  end
end
