class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :user_id
      t.string :order_id
      #t.string :integer

      t.timestamps null: false
    end
  end
end
