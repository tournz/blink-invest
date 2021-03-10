class Project < ApplicationRecord
  has_many :cash_yields
  has_many :favorites
  has_many :subscriptions
  has_many :messages
  after_create :calc_surface

  def net_equity_multiple
    (cash_yields.sum(&:value) / amount).round(1)
  end

  private

  def calc_surface
    update surface: amount / (rand(0.8..1.2) * 10_000).round
  end
end
