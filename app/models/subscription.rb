class Subscription < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :amount, numericality: { greater_than: 0, message: "must be greater than $0" }
  validate :project_cannot_be_overfunded
  after_save :update_funded

  def project_cannot_be_overfunded
    errors.add(:amount, "Subscription can't be superior to 100%") if project.oversubscribed?(self)
  end

  def update_funded
    if amount + project.subscriptions.sum(&:amount) == project.amount
      project.update(funded: true)
      Message.create(content: "The project is now 100% subscribed and confirmed", user: User.find_by(name: 'Blink Bot'), chatroom: project.chatroom)
    end
  end
end
