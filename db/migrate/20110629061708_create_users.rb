class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :college_id
      t.integer :year

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
