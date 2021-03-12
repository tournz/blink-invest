class PortfoliosController < ApplicationController
  def show
    @projects = current_user.projects.where(funded: false).distinct
    @projects_subscriptions = Subscription.joins(:project).where(user: current_user, projects: { funded: false })

    @confirmed_projects = current_user.projects.where(funded: true).distinct
    @confirmed_projects_subscriptions = Subscription.joins(:project).where(user: current_user, projects: { funded: true })
    # byebug
    # @net_cash_yield_average = sumproduct(@projects_subscriptions.amount)
  end

  private

  def weighted_average(data, coefficients)
    @projects.subscriptions
  end
end
