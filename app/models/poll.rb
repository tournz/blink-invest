class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :messages
  has_many :poll_options, dependent: :destroy
  has_many :responses, through: :poll_options
end
