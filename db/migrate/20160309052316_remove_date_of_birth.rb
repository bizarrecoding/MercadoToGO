class RemoveDateOfBirth < ActiveRecord::Migration
  def change
    remove_column :users, :date_of_birth, :datetime
    add_column :users, :date_of_birth, :date
  end
end
