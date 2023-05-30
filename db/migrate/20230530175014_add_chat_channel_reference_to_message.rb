class AddChatChannelReferenceToMessage < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :chat_channel, null: false, foreign_key: true
  end
end
