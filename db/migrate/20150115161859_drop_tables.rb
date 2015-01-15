class DropTables < ActiveRecord::Migration
  def change
    drop_table :tops
    drop_table :searches
    drop_table :bottoms
  end
end
