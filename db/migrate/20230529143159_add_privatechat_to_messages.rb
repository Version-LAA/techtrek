class AddPrivatechatToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :privatechat, null: false, foreign_key: true
  end
end
