class RemoveProjectFromPolls < ActiveRecord::Migration[6.0]
  def change
    remove_reference :polls, :project, null: false, foreign_key: true
  end
end
