class AddChatroomToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :chatroom, index: true, foreign_key: true
  end
end
