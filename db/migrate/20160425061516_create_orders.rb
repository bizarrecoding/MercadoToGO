class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :subtotal
      t.integer :iva
      t.integer :total
      t.string  :status

      t.timestamps null: false
    end
  end
end
