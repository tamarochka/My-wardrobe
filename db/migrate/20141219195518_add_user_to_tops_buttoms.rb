class AddUserToTopsButtoms < ActiveRecord::Migration
  def change
    add_column :tops, :user_id, :integer
    add_column :bottoms, :user_id, :integer
  end
end
