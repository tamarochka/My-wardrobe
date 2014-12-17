class CreateBottom < ActiveRecord::Migration
  def change
    create_table :bottoms do |t|
      t.string :bottom_type, null: false
      t.string :pic, null:false
    end
  end
end
