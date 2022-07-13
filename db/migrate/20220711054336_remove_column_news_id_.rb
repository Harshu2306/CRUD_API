class RemoveColumnNewsId < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :news_id
  end
end
