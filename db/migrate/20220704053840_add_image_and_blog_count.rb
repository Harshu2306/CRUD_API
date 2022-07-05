class AddImageAndBlogCount < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs , :image , :binary 
    add_column :blogs , :blog_count , :integer , :default => 0
  end
end
