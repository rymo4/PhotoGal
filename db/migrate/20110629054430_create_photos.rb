class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.integer :user_id
      t.integer :width
      t.integer :height
      t.string :camera
      t.string :comment
      t.integer :file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
