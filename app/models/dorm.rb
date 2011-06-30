class Dorm < ActiveRecord::Base
  has_many :users
  belongs_to :college
  has_many :photos, :through => :users
end
