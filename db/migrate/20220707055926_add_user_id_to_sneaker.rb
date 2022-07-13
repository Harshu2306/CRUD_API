class AddUserIdToSneaker < ActiveRecord::Migration[7.0]
  def change
    add_column :sneakers, :user_id, :integer
  end
end
