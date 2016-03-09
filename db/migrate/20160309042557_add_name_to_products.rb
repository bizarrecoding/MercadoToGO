class AddNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :integer
    add_column :products, :vendor, :string
    add_column :products, :description, :text
  end
end
