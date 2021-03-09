class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :poll_options
  has_many :responses, through: :poll_options
end
