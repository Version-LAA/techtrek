class AddTitleToChatChannel < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_channels, :name, :string
  end
end
