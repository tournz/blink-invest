class AddPollToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :poll, null: true, foreign_key: true
  end
end
