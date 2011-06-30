class AddSchoolToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :school_id, :integer
    add_column :users, :dorm_id, :integer
  end

  def self.down
    remove_column :users, :school_id
    remove_column :users, :dorm_id
  end
end
