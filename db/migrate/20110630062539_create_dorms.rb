class CreateDorms < ActiveRecord::Migration
  def self.up
    create_table :dorms do |t|
      t.integer :college_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :dorms
  end
end
