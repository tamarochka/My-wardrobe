class AddColumnTypeToTops < ActiveRecord::Migration
  def change
    add_column :tops, :top_type, :string
  end
end
