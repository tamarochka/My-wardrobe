class CreateClothinTable < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.string :clothing_type, null: false
      t.string :color
      t.string :weather
      t.string :image
      t.integer :user_id
      t.string  :condition,   default: "clean"
    end
  end
end
