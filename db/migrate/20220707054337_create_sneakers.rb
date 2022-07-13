class CreateSneakers < ActiveRecord::Migration[7.0]
  def change
    create_table :sneakers do |t|
      t.string :company
      t.string :name
      t.integer :size, null: false
      t.integer :price

      t.timestamps
    end
  end
end
