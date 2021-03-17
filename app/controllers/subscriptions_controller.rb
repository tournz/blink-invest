class SubscriptionsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_project, only: %i[new create]
  before_action :set_user, only: :create

  def new
    @subscription = Subscription.new
    @max_amount = @project.amount - @project.subscriptions.sum(&:amount)
    @users = @project.users.distinct
    @pie_data = ChartkickMethods.pie_chart_method(@users, @project)
  end


  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.project = @project
    @subscription.user = current_user
    @users = @project.users.distinct
    @max_amount = @project.amount - @project.subscriptions.sum(&:amount)
    if @subscription.save
      @user_stake = current_user.subscriptions.where(project: @project).sum(&:amount).round(2)
      @user_stake_percentage = (100 * @user_stake / @project.amount).round(2)
      @percentage_funded = (100 * (@subscription.amount + @project.subscriptions.sum(&:amount)) / @project.amount).round(1)
      Message.create(content: "Notification: #{current_user.name} has just made a subscription of #{number_to_currency(@subscription.amount)}. #{current_user.name}'s total stake is now #{number_to_currency(@user_stake)} amounting to #{@user_stake_percentage}% ownership. The project is now #{@percentage_funded}% funded.", user: User.find_by(name: 'Blink Bot'), chatroom: @project.chatroom)
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
