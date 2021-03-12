class PortfoliosController < ApplicationController
  def show
    @projects = current_user.projects.where(funded: false).distinct
    @projects_subscriptions_amount = Subscription.joins(:project).where(user: current_user, projects: { funded: false }).sum(&:amount)
    @confirmed_projects = current_user.projects.where(funded: true).distinct
    @confirmed_projects_subscriptions_amount = Subscription.joins(:project).where(user: current_user, projects: { funded: true }).sum(&:amount)

    @subscriptions = current_user.subscriptions
    @data = []
    @subscriptions.each do |subscription|
      data = []
      # byebug
      name = subscription.project.name
      subscription.project.cash_yields.each do |cash_yield|
        data << [cash_yield.date, cash_yield.value] if cash_yield.date < Date.today + 4.years
      end
      @data << {
        name: name,
        data: data
      }
    end
  end
  end
