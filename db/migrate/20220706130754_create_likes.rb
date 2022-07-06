class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :like_count, default: 0
      t.integer :likeable_id
      t.string :likeable_type
      t.timestamps
    end
  end
end
