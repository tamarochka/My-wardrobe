class AddColumnTops < ActiveRecord::Migration
  def change
    add_column :tops, :color, :string
  end
end
