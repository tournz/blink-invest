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

  def cash_yield_array
    irr_array = []
    cash_yields.each do |cash_yield|
      irr_array << [cash_yield.value, cash_yield.date]
    end
    irr_array
  end

  def target_net_irr
    irr_array = cash_yield_array
    irr_range = [0, 1]
    iterations = 0
    npv = -amount
    puts irr_array
    until npv < amount * 0.005 && npv > -amount * 0.005
      range_average = (irr_range[0] + irr_range[1]) / 2
      puts irr_range
      puts "This is iteration #{iterations}"
      puts npv / amount.to_f
      iterations += 1
      npv = -amount
      irr_array.each do |date_flow|
        npv += date_flow[0] / ((1 + range_average)**((date_flow[1] - start_date) / 365.25))
      end
      if npv.negative?
        irr_range[1] = range_average
      else
        irr_range[0] = range_average
      end
    end
    puts npv
    puts amount
    puts npv / amount.to_f
    puts "Calculated with #{iterations}"
    return (irr_range[0] + irr_range[1]) / 2
  end

  private

  def calc_surface
    update surface: amount / (rand(0.8..1.2) * 10_000).round
  end

end
