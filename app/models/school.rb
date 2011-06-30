class School < ActiveRecord::Base
  belongs_to :college
  has_many :users
  has_many :photos, :through => :users
end
