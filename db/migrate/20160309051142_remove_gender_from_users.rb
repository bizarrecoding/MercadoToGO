class RemoveGenderFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_female, :boolean
  end
end
