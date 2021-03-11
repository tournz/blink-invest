class PortfoliosController < ApplicationController
  def show
    @projects = current_user.projects.where(funded: false).distinct
    @projects_subscriptions_amount = Subscription.joins(:project).where(user: current_user, projects: { funded: false }).sum(&:amount)
    @confirmed_projects = current_user.projects.where(funded: true).distinct
    @confirmed_projects_subscriptions_amount = Subscription.joins(:project).where(user: current_user, projects: { funded: true }).sum(&:amount)
  end
end
