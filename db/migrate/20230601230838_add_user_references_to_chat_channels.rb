class AddUserReferencesToChatChannels < ActiveRecord::Migration[7.0]
  def change
    add_reference :chat_channels, :user1, foreign_key: {to_table: :users}
    add_reference :chat_channels, :user2, foreign_key: {to_table: :users}
  end
end
