class DropColumnTops < ActiveRecord::Migration
  def change
    remove_column :tops, :type, :string
  end
end
