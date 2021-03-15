class RemoveProjectFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :project, index: true, foreign_key: true
  end
end
