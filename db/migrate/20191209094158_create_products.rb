class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.string :name
      t.text :memo
      t.integer :price
      t.date :day
      t.integer :category_id
    end
  end
end
