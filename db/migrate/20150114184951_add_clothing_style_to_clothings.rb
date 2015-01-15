class AddClothingStyleToClothings < ActiveRecord::Migration
  def change

    add_column :clothings, :clothing_style, :string
    add_timestamps(:clothings)
  end
end
