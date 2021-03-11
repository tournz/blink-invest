class SubscriptionsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  before_action :set_user, only: :create

  def new
    @subscription = Subscription.new
    @max_amount = @project.amount * (1 - @project.percentage_subscribed)
    @users = @project.users.distinct
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.project = @project
    @subscription.user = @user
    if @subscription.save
      redirect_to project_path(@project)
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
