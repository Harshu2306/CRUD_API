class ChangesInCommentModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :title, :comment_title
    add_column :comments, :blog_id, :integer
  end
end
