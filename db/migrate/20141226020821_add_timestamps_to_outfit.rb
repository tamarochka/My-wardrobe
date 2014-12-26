class AddTimestampsToOutfit < ActiveRecord::Migration
  def change
    add_timestamps(:outfits)
  end
end
