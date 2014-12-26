class CahngeColumnBottom < ActiveRecord::Migration
  def change
    change_column :bottoms, :condition, :string, :default => "clean"
  end
end
