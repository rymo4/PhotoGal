class AddTagIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :tag_id, :integer
  end

  def self.down
    remove_column :photos, :tag_id
  end
end
