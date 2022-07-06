class RenameBlogCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :news , :blog_count , :news_count
  end
end
