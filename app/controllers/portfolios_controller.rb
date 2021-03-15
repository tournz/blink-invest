class PortfoliosController < ApplicationController
  def show
    @projects = current_user.projects.where(funded: false).distinct
    @projects_subscriptions = Subscription.joins(:project).where(user: current_user, projects: { funded: false })

    @confirmed_projects = current_user.projects.where(funded: true).distinct
    @confirmed_projects_subscriptions = Subscription.joins(:project).where(user: current_user, projects: { funded: true })

    @net_cash_yield_average = sumproduct(net_cash_yields_array(@projects), project_invested_amount_array(@projects)) / @projects_subscriptions.sum(&:amount)
    @target_net_irr_average = sumproduct(target_net_irr_array(@projects), project_invested_amount_array(@projects)) / @projects_subscriptions.sum(&:amount)
    @net_equity_multiple_average = sumproduct(net_equity_multiple_array(@projects), project_invested_amount_array(@projects)) / @projects_subscriptions.sum(&:amount)
    @ltv_ratio_average = sumproduct(ltv_ratio_array(@projects), project_invested_amount_array(@projects)) / @projects_subscriptions.sum(&:amount)
    @management_fee_average = sumproduct(management_fee_array(@projects), project_invested_amount_array(@projects)) / @projects_subscriptions.sum(&:amount)

    @confirmed_net_cash_yield_average = sumproduct(net_cash_yields_array(@confirmed_projects), project_invested_amount_array(@confirmed_projects)) / @confirmed_projects_subscriptions.sum(&:amount)
    @confirmed_target_net_irr_average = sumproduct(target_net_irr_array(@confirmed_projects), project_invested_amount_array(@confirmed_projects)) / @confirmed_projects_subscriptions.sum(&:amount)
    @confirmed_net_equity_multiple_average = sumproduct(net_equity_multiple_array(@confirmed_projects), project_invested_amount_array(@confirmed_projects)) / @confirmed_projects_subscriptions.sum(&:amount)
    @confirmed_ltv_ratio_average = sumproduct(ltv_ratio_array(@confirmed_projects), project_invested_amount_array(@confirmed_projects)) / @confirmed_projects_subscriptions.sum(&:amount)
    @confirmed_management_fee_average = sumproduct(management_fee_array(@confirmed_projects), project_invested_amount_array(@confirmed_projects)) / @confirmed_projects_subscriptions.sum(&:amount)
    @confirmed_projects_subscriptions_amount = Subscription.joins(:project).where(user: current_user, projects: { funded: true }).sum(&:amount)

    @subscriptions = current_user.subscriptions
    @subscriptions = @subscriptions.select(:project_id).distinct
    @data = []
    @subscriptions.each do |subscription|
      data = []
      name = subscription.project.name
      subscription.project.cash_yields.each do |cash_yield|
        if params[:search][:start_date].empty? || params[:search][:end_date].empty?
          data << [cash_yield.date, cash_yield.value]
        else
          start_date = params[:search][:start_date].to_date
          end_date = params[:search][:end_date].to_date
          data << [cash_yield.date, cash_yield.value] if cash_yield.date > start_date && cash_yield.date < end_date
        end
      end
      @data << {
        name: name,
        data: data
      }
    end
    # Reject empty entries
    @data = @data.reject { |cash_yield| cash_yield[:data].empty? }
    # Sort by date
    @data.sort_by! do |cash_yield|
      cash_yield[:data][0][0]
    end
  end

  private

  def project_invested_amount_array(projects_array)
    project_invested_amount_array = []
    projects_array.each do |project|
      project_invested_amount_array << current_user.subscriptions.where(project: project).sum(&:amount)
    end
    project_invested_amount_array
  end

  def net_cash_yields_array(projects_array)
    cash_yields_array = []
    projects_array.each do |project|
      cash_yields_array << project.net_cash_yield
    end
    cash_yields_array
  end

  def target_net_irr_array(projects_array)
    array = []
    projects_array.each do |project|
      array << project.target_net_irr
    end
    array
  end

  def net_equity_multiple_array(projects_array)
    array = []
    projects_array.each do |project|
      array << project.net_equity_multiple
    end
    array
  end

  def ltv_ratio_array(projects_array)
    array = []
    projects_array.each do |project|
      array << project.ltv_ratio
    end
    array
  end

  def management_fee_array(projects_array)
    array = []
    projects_array.each do |project|
      array << project.management_fee
    end
    array
  end
end
