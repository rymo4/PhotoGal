class Favorite < ActiveRecord::Base
  
  attr_accessible :photo_id
  
  belongs_to :user
  has_one :photo
  
  validates :user_id, :presence => true
  validates :photo_id, :presence => true
end
