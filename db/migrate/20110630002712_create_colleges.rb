class CreateColleges < ActiveRecord::Migration
  def self.up
    create_table :colleges do |t|
      t.string :name
      t.string :dorms
      t.string :schools

      t.timestamps
    end
  end

  def self.down
    drop_table :colleges
  end
end