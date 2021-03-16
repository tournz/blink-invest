class PollOption < ApplicationRecord
  belongs_to :poll
  has_many :responses, dependent: :destroy
end
