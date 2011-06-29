class Photo < ActiveRecord::Base
  attr_accessible :user_id, :title, :image, :remote_image_url
  belongs_to :user
  mount_uploader :image, ImageUploader
end
