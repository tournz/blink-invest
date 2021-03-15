class AddChatrooomToPolls < ActiveRecord::Migration[6.0]
  def change
    add_reference :polls, :chatroom, null: false, foreign_key: true
  end
end
