class AddIdParentToListMusic < ActiveRecord::Migration
  def change
    add_column :list_musics, :parent_id, :integer, index: :true, foreign_key: {to_table: :list_musics}
    #add_reference :list_musics, :parent, index: true, foreign_key: {to_table: :list_musics}
  end
end
