class CreateSearchesTable < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
    end
  end
end
