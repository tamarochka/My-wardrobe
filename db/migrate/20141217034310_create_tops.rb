class CreateTops < ActiveRecord::Migration
  def change
    create_table :tops do |t|
      t.string :type, null: false
      t.string :pic, null: false
    end
  end
end
