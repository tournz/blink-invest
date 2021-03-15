class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :poll_options
  has_many :responses, through: :poll_options
end
