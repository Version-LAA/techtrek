class CreateChatChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_channels do |t|

      t.timestamps
    end
  end
end
