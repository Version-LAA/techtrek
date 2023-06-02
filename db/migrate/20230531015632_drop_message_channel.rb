class DropMessageChannel < ActiveRecord::Migration[7.0]
  def change
    drop_table :message_channels
  end
end
