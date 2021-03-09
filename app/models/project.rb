class Project < ApplicationRecord
  has_many :cash_yields
  has_many :favorites
  has_many :subscriptions
  has_many :messages
end
