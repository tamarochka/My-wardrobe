class AddColumnColor < ActiveRecord::Migration
  def change
    add_column :bottoms, :color, :string
  end
end
