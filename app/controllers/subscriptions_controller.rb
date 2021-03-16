class SubscriptionsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  before_action :set_user, only: :create

  def new
    @subscription = Subscription.new
    @max_amount = @project.subscriptions.sum(&:amount)
    @users = @project.users.distinct
  end

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
