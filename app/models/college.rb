class College < ActiveRecord::Base
  has_many :users
  has_many :schools
end
