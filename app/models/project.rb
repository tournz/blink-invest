class Project < ApplicationRecord
  has_many :cash_yields, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :investment_highlights
  has_one_attached :banner_picture
  after_create :calc_surface

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  def net_equity_multiple
    (cash_yields.sum(&:value) / amount).round(1)
  end

  def net_cash_yield
    (cash_yields.sum(&:value) / (amount * cash_yields.count)).round(4)
  end

  def percentage_subscribed
    (subscriptions.sum(&:amount) / amount).round(2)
  end

  def target_hold
    (maturity_date.year - start_date.year) - (maturity_date.month >= start_date.month ? 0 : 1)
  end

  private

  def calc_surface
    update surface: amount / (rand(0.8..1.2) * 10_000).round
  end
end
