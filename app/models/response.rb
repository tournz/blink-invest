class Response < ApplicationRecord
  belongs_to :user
  belongs_to :poll_option
  validates :poll_option, presence: true

  def poll
    poll_option.poll
  end
end
