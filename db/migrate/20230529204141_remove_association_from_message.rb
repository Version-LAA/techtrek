class RemoveAssociationFromMessage < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :privatechat_id
  end
end
