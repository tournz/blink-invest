class Chatroom < ApplicationRecord
  belongs_to :project
  has_many :messages, dependent: :destroy
  has_many :polls, dependent: :destroy
end
