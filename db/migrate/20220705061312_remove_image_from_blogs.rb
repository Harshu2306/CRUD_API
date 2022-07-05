class RemoveImageFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :image, :binary
  end
end
