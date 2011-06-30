class College < ActiveRecord::Base
  has_many :users
  has_many :schools
  has_many :dorms
end
