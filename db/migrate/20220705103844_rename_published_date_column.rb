class RenamePublishedDateColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :blogs, :published_Date, :published_date
  end
end
