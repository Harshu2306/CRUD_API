class RenameNameFromSneaker < ActiveRecord::Migration[7.0]
  def change
    rename_column :sneakers, :name, :sneaker_name
  end
end
