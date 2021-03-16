class Quiz < ApplicationRecord
  validates :risk, presence: true, length: { minimum: 3 }
  validates :horizon, presence: true
  validates :income_inv_percentage, presence: true
  validates :annual_income, presence: true
  validates :risk_case, presence: true
  validates :age, inclusion: { in: 0..100 }
end
