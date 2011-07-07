class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  
  
  
  attr_accessible :photo_id
  
  
  
  validates :user_id, :presence => true
  validates :photo_id, :presence => true
end
