class CreateDisasters < ActiveRecord::Migration[5.2]
  def change
    create_table :disasters do |t|
      t.string :title
      t.text :information
      t.timestamps
      t.integer :category_id
    end
    add_index :disasters, :category_id
  end
end
