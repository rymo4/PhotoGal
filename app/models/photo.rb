class Photo < ActiveRecord::Base
  attr_accessible :user_id, :title, :image, :comment, :tag_id
  
  
  belongs_to :user
  belongs_to :college
  belongs_to :school
  belongs_to :dorm
  has_many :comments
  has_many :notifications
  has_many :favorites
  has_one :tag
  
  
  validates :title, :presence     => true, 
                    :length       => { :within => 2..40 }
  validates :comment, :presence     => true, 
                    :length       => { :within => 2..141 }    
  validates :image, :presence     => true 
  validates :user_id, :presence     => true 
  validates :tag_id, :presence     => true                
  
  
  mount_uploader :image, ImageUploader
  
  def self.from_users_followed_by(user)
      where(:user_id => user.following.push(user))
  end
  default_scope :order => 'photos.created_at DESC'

    
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

  def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids})",
            { :user_id => user })
  end
end
