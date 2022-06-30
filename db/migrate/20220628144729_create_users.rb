class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name , null: false
      t.string :username , null: false , unique: true
      t.string :email , null: false
      t.string :phone

      t.timestamps
    end
  end
end
