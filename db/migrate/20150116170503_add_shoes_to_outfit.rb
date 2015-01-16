class AddShoesToOutfit < ActiveRecord::Migration
  def change
    add_column :outfits, :shoe_pair_id, :integer
  end
end
