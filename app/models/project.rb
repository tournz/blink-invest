class Project < ApplicationRecord
  has_many :cash_yields, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
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

  # def nfv(data, guess)
  # today = Date.today()
  #  nfv = 0
  #  data.each do |(cf, date)|
  #    datestring = date.to_s
  #    formatteddate = Date.parse(datestring).to_date
  #    t_in_days = (today – formatteddate).numerator / (today – formatteddate).denominator
  #    nfv = nfv + cf*((1+guess)**t_in_days)
  #  end
  #  return nfv
  # end

  # def xirr(cashflow, dates)
  #  if cashflow.length != dates.length
  #    abort(“length(cashflow) not equal to length(dates)”)
  #  else
  #    nil
  #  end
  #  data = cashflow.zip(dates)

    # Bisection method finding the rate to zero nfv

  #  left = -0.99/365
  #  right = 9.99/365
  #  epsilon = 1e-8
  #  while ((right-left).abs > 2*epsilon) do
  #    midpoint = (right+left)/2
  #    if (nfv(data, left) * nfv(data, midpoint) > 0)
  #      left = midpoint
  #    else
  #      right = midpoint
  #    end
  #  end
      # Irr for daily cashflow (not in percentage format)
  #    irr = (right+left) / 2
  #    # Irr for daily cashflow multiplied by 365 to get yearly return
  #    irr = irr * 365
      # Annualized yield (return) reflecting compounding effect of daily returns
  #    irr = (1 + irr / 365) ** 365 – 1
  #  return irr
  #end

  def target_net_irr
    irr_array = cash_yield_array
    bottom = 0
    top = 1
    iterations = 0
    npv = -amount
    puts irr_array
    until npv < amount * 0.005 && npv > -amount * 0.005
      range_average = (bottom + top) / 2
      puts bottom
      puts top
      puts "This is iteration #{iterations}"
      puts npv / amount.to_f
      iterations += 1
      npv = -amount
      irr_array.each do |date_flow|
        npv += date_flow[0] / ((1 + range_average)**((date_flow[1] - start_date) / 365.25))
      end
      puts npv
      if npv.negative?
        puts "npv negative"
        top = range_average
      else
        puts "npv positive"
        bottom = range_average
      end
    end
    puts npv
    puts amount
    puts npv / amount.to_f
    puts "Calculated with #{iterations}"
    return (bottom + top) / 2
  end

  private

  def calc_surface
    update surface: amount / (rand(0.8..1.2) * 10_000).round
  end

end
