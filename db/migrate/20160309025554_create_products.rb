class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      #t.references :vendor, index: true, foreign_key: true 
      t.string  :name, null: false, unique: true
      #quitar
      t.integer :pId, null: false, unique: true 
      t.integer :price, null: false 
      #quitar
      t.integer :vendorId, null: false, unique: true 
      t.text    :description
      t.string  :category
      t.string  :subcategory
      t.string  :image
      t.timestamps null: false
    end
  end
end
