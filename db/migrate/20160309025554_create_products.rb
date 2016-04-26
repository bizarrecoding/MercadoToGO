class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.integer :pId, null: false, unique: true 
      t.integer :price, null: false, unique: true 
      t.integer :vendorId, null: false, unique: true 
      t.text :description
      t.string :category
      t.string :subcategory
      t.string :image
      t.timestamps null: false
    end
  end
end
