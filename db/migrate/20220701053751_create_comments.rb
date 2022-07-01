class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title , null: false
      t.text :comment_text 
      t.boolean :is_delete , default: false

      t.timestamps 
    end
  end
end
