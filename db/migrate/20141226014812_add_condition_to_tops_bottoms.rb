class AddConditionToTopsBottoms < ActiveRecord::Migration
  def change
    add_column :tops, :condition, :string, :default => "clean"
    add_column :bottoms, :condition, :string, :dafault => "clean"
  end
end
