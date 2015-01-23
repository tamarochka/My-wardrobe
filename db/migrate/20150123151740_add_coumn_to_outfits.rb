class AddCoumnToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :shared, :string, default: "no"
  end
end
