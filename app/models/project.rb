class Project < ApplicationRecord
  has_many :cash_yields, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  has_many :investment_highlights
  has_one :chatroom, dependent: :destroy
  has_one_attached :banner_picture
  after_create :calc_surface
  after_create :create_chatroom

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def oversubscribed?(subscription)
    subscription.amount + subscriptions.sum(&:amount) > amount
  end

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

  def cash_yield_array
    irr_array = []
    cash_yields.each do |cash_yield|
      irr_array << [cash_yield.value, cash_yield.date]
    end
    irr_array
  end


  def target_net_irr
    irr_array = cash_yield_array
    bottom = 0
    top = 1
    iterations = 0
    npv = -amount
    until npv < amount * 0.000000001 && npv > -amount * 0.000000001
      range_average = (bottom + top).to_f / 2
      iterations += 1
      npv = -amount
      irr_array.each do |date_flow|
        npv += date_flow[0] / ((1 + range_average)**((date_flow[1] - start_date) / 365.25))
      end
      if npv.negative?
        top = range_average
      else
        bottom = range_average
      end
    end
    return (bottom + top) / 2
  end

  # SEARCH

  include PgSearch::Model
  pg_search_scope :search_by_name_location_description,
    against: [ :name, :location, :description],
    using: {
      tsearch: { prefix: true }
    }

  # SEARCH END

  private

  def create_chatroom
    Chatroom.create(project: self)
  end

  def calc_surface
    update surface: amount / (rand(0.8..1.2) * 10_000).round
  end

end
