class AddGossipIdColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :gossip_id, :integer
  end
end
