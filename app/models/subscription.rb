class Subscription < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :amount, numericality: { greater_than: 1000, message: "must be greater than $1000" }
  validate :project_cannot_be_overfunded
  after_create :update_funded
  after_save :update_funded

  def project_cannot_be_overfunded
    errors.add(:amount, "Subscription can't be superior to 100%") if project.oversubscribed?(self)
  end

  def update_funded
    @project = project
    @project.update(funded: true) if @project.percentage_subscribed >= 1
  end
end
