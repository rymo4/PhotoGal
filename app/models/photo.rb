class Photo < ActiveRecord::Base
  attr_accessible :user_id, :title, :image, :remote_image_url, :comment
  belongs_to :user
  belongs_to :college
  belongs_to :school
  belongs_to :dorm
  
  
  validates :title, :presence     => true, 
                    :length       => { :within => 2..40 }
  validates :comment, :presence     => true, 
                    :length       => { :within => 2..141 }    
  validates :image, :presence     => true 
  validates :user_id, :presence     => true                
  
  
  mount_uploader :image, ImageUploader
end
