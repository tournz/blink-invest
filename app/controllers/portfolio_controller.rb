class PortfolioController < ApplicationController
  def show
    @subscriptions = current_user.subscriptions
    @projects
  end

end
