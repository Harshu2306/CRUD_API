class RemoveColumnFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :avatar, :string
  end
end
