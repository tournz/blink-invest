class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites
  has_many :subscriptions
  has_many :messages
  has_many :polls
  has_many :responses
  has_many :projects, through: :subscriptions
  has_one_attached :photo
  has_one :quiz
end
