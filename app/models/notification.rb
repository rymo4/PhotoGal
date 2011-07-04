class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  belongs_to :comment
end
