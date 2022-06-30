class CreateBlog < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :view_count
      t.datetime :published_Date
      t.boolean :is_active , default: true
      t.boolean :is_delete , default: false

      t.timestamps
    end
  end
end
