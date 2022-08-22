class CreatePlayLists < ActiveRecord::Migration
  def change
    create_table :play_lists do |t|
      t.string :track
      t.string :album
      t.string :artist
      t.string :genres

      t.timestamps null: false
    end
  end
end
