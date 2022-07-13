class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :news_title, null: false
      t.string :news_body, null: false
      t.datetime :published_date
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
