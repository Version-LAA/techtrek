class DropPrivatechat < ActiveRecord::Migration[7.0]
  def change
    drop_table :privatechats, force: :cascade
  end
end
