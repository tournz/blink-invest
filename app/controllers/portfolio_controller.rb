class PortfolioController < ApplicationController
  def show
    @subscriptions = current_user.subscriptions
    @data = []
    data = []
    @subscriptions.each do |subscription|
      name = subscription.project.name
      subscription.project.cash_yields.each do |cash_yield|
        data << [cash_yield.date, cash_yield.value] if cash_yield.date < Date.new(2023)
      end
      @data << {
        name: name,
        data: data
      }
    end
  end
end
