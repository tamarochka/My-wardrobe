class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.integer :top_id
      t.integer :bottom_id
    end
  end
end
