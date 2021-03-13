class Subscription < ApplicationRecord
  belongs_to :project
  belongs_to :user
  after_create :update_funded

  def update_funded
    @project = project
    @project.update(funded: true) if @project.percentage_subscribed == 1
  end
end
