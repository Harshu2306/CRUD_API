class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title , null: false
      t.text :body , null:false
      t.datetime :published_date
      t.integer :blog_count , :default => 0
      t.boolean :is_active , default: true
      t.boolean :is_delete , default: false

      t.timestamps
    end
  end
end
